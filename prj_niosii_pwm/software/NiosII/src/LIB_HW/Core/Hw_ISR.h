//----------------------------------------------------------------------------
//    프로그램명 	: ISR 관련 헤더
//
//    만든이     	:
//
//    날  짜     	:
//    
//    최종 수정  	:
//
//    MPU_Type		:
//
//    파일명     	: Hw_ISR.c
//----------------------------------------------------------------------------
                                                                                                 
#ifndef __HW_ISR_H__
#define __HW_ISR_H__


#ifdef   HW_ISR_LOCAL
#define  EXT_HW_ISR_DEF
#else
#define  EXT_HW_ISR_DEF     extern
#endif



#include "Hw.h"





EXT_HW_ISR_DEF s32  Hw_ISR_Init( void );


#endif
