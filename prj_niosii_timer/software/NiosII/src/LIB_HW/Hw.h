//----------------------------------------------------------------------------
//    프로그램명 	: Hw 공용
//
//    만든이     	:
//
//    날  짜     	:
//    
//    최종 수정  	:
//
//    MPU_Type		:
//
//    파일명     	: Hw.h
//----------------------------------------------------------------------------
                                                                                                 
#ifndef __HW_H__
#define __HW_H__                                                                                                  


#ifdef   HW_LOCAL
#define  EXT_HW_DEF 
#else
#define  EXT_HW_DEF     extern
#endif


//-- 기능 설정
//


//-- 타이머 채널 설정
//
#define HW_TIMER_CH_LED					0


#define HW_UART_CH_MSP					HW_UART_COM1


//-- xil
//
#include "system.h"

#include "sys/alt_timestamp.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_timer_regs.h"


//-- Core
//
#include "Hw_Regs.h"
#include "Hw_Define.h"
#include "Hw_Uart.h"
#include "Hw_ISR.h"
#include "Hw_Led.h"
#include "Hw_Timer.h"




//-- Driver
//
#include "Lb_Printf.h"


EXT_HW_DEF void Hw_Init( void );

EXT_HW_DEF void Hw_Wait( u32 delay );
EXT_HW_DEF void Hw_Wait_Usec( u32 usec );
EXT_HW_DEF u32  millis( void );
EXT_HW_DEF u32  micros( void );

#endif
