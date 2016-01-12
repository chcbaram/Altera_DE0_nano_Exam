//----------------------------------------------------------------------------
//    프로그램명 	: LED 관련 함수
//
//    만든이     	:
//
//    날  짜     	:
//    
//    최종 수정  	:
//
//    MPU_Type		:
//
//    파일명     	: Hw_Led.c
//----------------------------------------------------------------------------


//----- 헤더파일 열기
//
#define  HW_LED_LOCAL


#include "Hw_Led.h"
#include "altera_avalon_pio_regs.h"





#define LED_ADDR_BASE	PIO_0_BASE


//-- 내부 변수
//






/*---------------------------------------------------------------------------
     TITLE   : Hw_Led_Init
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Led_Init( void )
{


	//-- 방향 출력으로 설정
	//


	Hw_Led_Off(0);
	Hw_Led_Off(1);	
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Led_On
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Led_On( u8 Ch )
{	
	u32 Data;


	Data = IORD_ALTERA_AVALON_PIO_DATA(LED_ADDR_BASE);
	SET_BIT(Data, Ch);
	IOWR_ALTERA_AVALON_PIO_DATA(LED_ADDR_BASE, Data);
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Led_Off
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Led_Off( u8 Ch )
{
	u32 Data;

	Data = IORD_ALTERA_AVALON_PIO_DATA(LED_ADDR_BASE);
	CLR_BIT(Data, Ch);
	IOWR_ALTERA_AVALON_PIO_DATA(LED_ADDR_BASE, Data);
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Led_Toggle
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Led_Toggle( u8 Ch )
{
	u32 Data;


	Data = IORD_ALTERA_AVALON_PIO_DATA(LED_ADDR_BASE);
	TGL_BIT(Data, Ch);
	IOWR_ALTERA_AVALON_PIO_DATA(LED_ADDR_BASE, Data);
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Led_Wait
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Led_Wait( u32 delay )
{
    volatile u32 i;
    for ( i = 0 ; i < delay ; i++ ){ };
}



















 
