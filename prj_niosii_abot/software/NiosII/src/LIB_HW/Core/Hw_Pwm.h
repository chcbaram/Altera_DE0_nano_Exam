//----------------------------------------------------------------------------
//    프로그램명 : PWM 관련 함수 헤더
//
//    만든이     : Cho Han Cheol
//
//    날  짜     :
//    
//    최종 수정  :
//
//    MPU_Type   : 
//
//    파일명     : Hw_Pwm.h
//----------------------------------------------------------------------------
                       
#ifndef __HW_PWM_H__
#define __HW_PWM_H__ 




#ifdef   HW_PWM_LOCAL
#define  EXT_HW_PWM_DEF 
#else
#define  EXT_HW_PWM_DEF     extern
#endif


#include "Hw.h"


#define HW_PWM_MAX_DUTY	255

#define HW_PWM_PERIOD	255


EXT_HW_PWM_DEF void Hw_Pwm_Init(void);
EXT_HW_PWM_DEF void Hw_Pwm_SetDir( u8 Ch, u8 Dir );
EXT_HW_PWM_DEF void Hw_Pwm_SetDuty( u8 Ch, u16 DutyRatio );
EXT_HW_PWM_DEF void Hw_Pwm_SetPercent( u8 Ch, u16 PercentRatio );


#endif
