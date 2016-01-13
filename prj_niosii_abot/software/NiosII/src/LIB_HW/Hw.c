//----------------------------------------------------------------------------
//    프로그램명 	: Hw 관련 함수
//
//    만든이     	:
//
//    날  짜     	:
//    
//    최종 수정  	:
//
//    MPU_Type		:
//
//    파일명     	: Hw.c
//----------------------------------------------------------------------------


//----- 헤더파일 열기
//
#define  HW_LOCAL  

#include "Hw.h"






/*---------------------------------------------------------------------------
     TITLE   : Hw_Init
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Init( void )
{
	Hw_ISR_Init();
	Hw_Led_Init();
	Hw_Uart_Init();
	Hw_Pwm_Init();
	Hw_DcMotor_Init();

	Enable_ISR();
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Wait
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Wait( u32 delay )
{
    volatile u32 i;
    for ( i = 0 ; i < delay ; i++ ){ };
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Wait_Usec
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Wait_Usec( u32 usec )
{
    Hw_Wait( usec * 83 );
}





/*---------------------------------------------------------------------------
     TITLE   : millis
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
u32 millis( void )
{
	return alt_timestamp()/1000;
}





/*---------------------------------------------------------------------------
     TITLE   : micros
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
u32 micros( void )
{
	return alt_timestamp();
}
















 
