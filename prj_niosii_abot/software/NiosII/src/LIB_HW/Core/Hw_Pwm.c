//----------------------------------------------------------------------------
//    프로그램명 : PWM 관련 함수
//
//    만든이     : Cho Han Cheol
//
//    날  짜     :
//    
//    최종 수정  :
//
//    MPU_Type   : 
//
//    파일명     : Hw_Pwm.c
//----------------------------------------------------------------------------



//----- 헤더파일 열기
//
#define  HW_PWM_LOCAL  

#include "Hw_Pwm.h"






//----- 내부 함수
//



//----- 내부 변수











/*---------------------------------------------------------------------------
     TITLE   : Hw_Pwm_Init
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Pwm_Init(void)
{	
	u32 Reg;


	//-- PWM Ch1
	//
	Reg =	( 0 << 8 ) |	// Dir
			( 0 << 0 );		// Clock
	IOWR(IP_PWM_0_BASE, 0, Reg);
	IOWR(IP_PWM_0_BASE, 1, 0);

	//-- PWM Ch2
	//
	IOWR(IP_PWM_0_BASE, 2, Reg);
	IOWR(IP_PWM_0_BASE, 3, 0);
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Pwm_SetDir
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Pwm_SetDir( u8 Ch, u8 Dir )
{
	u32 Reg;


	switch( Ch )
	{
		case 0:
			Reg = IORD(IP_PWM_0_BASE, 0);

			if( Dir == 0 ) CLR_BIT( Reg, 8 );
			else           SET_BIT( Reg, 8 );

			IOWR(IP_PWM_0_BASE, 0, Reg);
			break;

		case 1:
			Reg = IORD(IP_PWM_0_BASE, 2);

			if( Dir == 0 ) CLR_BIT( Reg, 8 );
			else           SET_BIT( Reg, 8 );

			IOWR(IP_PWM_0_BASE, 2, Reg);
			break;
	}
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Pwm_SetDuty
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Pwm_SetDuty( u8 Ch, u16 DutyRatio )
{
	u32 Reg;


	switch( Ch )
	{
		case 0:
			Reg = DutyRatio * HW_PWM_PERIOD / HW_PWM_MAX_DUTY;
			IOWR(IP_PWM_0_BASE, 1, Reg);
			break;

		case 1:
			Reg = DutyRatio * HW_PWM_PERIOD / HW_PWM_MAX_DUTY;
			IOWR(IP_PWM_0_BASE, 3, Reg);
			break;
	}
}





/*---------------------------------------------------------------------------
     TITLE   : Hw_Pwm_SetPercent
     WORK    : 
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void Hw_Pwm_SetPercent( u8 Ch, u16 PercentRatio )
{
	if( PercentRatio > 100 ) PercentRatio = 100;

	Hw_Pwm_SetDuty( Ch, PercentRatio * HW_PWM_PERIOD / 100 );
}


