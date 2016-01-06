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


	Main_Init();


	i = 0;

	while (1)
	{
		Hw_Led_Toggle(0);

		for (Delay = 0; Delay < 0x10000; Delay++);

		Hw_Uart_Printf( HW_UART_COM1, "Send.. %d\r\n", i++ );
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


	Hw_Uart_SetReceiveFuncISR( 0, Uart1_ISR );
}

