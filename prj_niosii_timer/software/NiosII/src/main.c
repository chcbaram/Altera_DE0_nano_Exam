//----------------------------------------------------------------------------
//    프로그램명 	: Main
//
//    만든이     	: Cho Han Cheol (Baram)
//
//    날  짜     	: 2013. 8.20.
//
//    최종 수정  	:
//
//    MPU_Type	:
//
//    파일명     	: Main.c
//----------------------------------------------------------------------------
/*
*/
//-----
//
#define  MAIN_LOCAL

#include "Main.h"



void Main_Init( void );





void Uart1_ISR(char Ch)
{
	Lb_printf("Received : %c\n", Ch);
	Hw_Led_Toggle(7);
}



/*---------------------------------------------------------------------------
     TITLE   : main
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
int main(void)
{
	vu32 Delay;
	u32 i;
	u32 tTimer[2];

	Main_Init();


	Lb_printf( "Start\n" );

	i = 0;

	while (1)
	{
		if( (millis()-tTimer[0]) >= 500 )
		{
			tTimer[0] = millis();
			Hw_Led_Toggle(0);
		}

		if( (millis()-tTimer[1]) >= 500 )
		{
			tTimer[1] = millis();
		}


		if( MSP_GetReceived() == TRUE )
		{
			Lb_printf( "MSP Received : %d, R:%d, P:%d, Y:%d, T:%d\n",
					MSP_Get_CmdPtr()->Cmd,
					MSP_Get_CmdRcPtr()->Roll,
					MSP_Get_CmdRcPtr()->Pitch,
					MSP_Get_CmdRcPtr()->Yaw,
					MSP_Get_CmdRcPtr()->Throthle);
		}
	}

	return 0;
}





/*---------------------------------------------------------------------------
     TITLE   : Main_Init
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Main_Init( void )
{
	Hw_Init();
	Ap_Init();
}

