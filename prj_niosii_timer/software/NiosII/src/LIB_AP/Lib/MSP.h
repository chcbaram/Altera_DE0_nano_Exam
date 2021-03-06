//----------------------------------------------------------------------------
//    프로그램명 	:
//
//    만든이     	: Cho Han Cheol
//
//    날  짜     	:
//    
//    최종 수정  	:
//
//    MPU_Type	:
//
//    파일명     	: Msp.h
//----------------------------------------------------------------------------

#ifndef __MSP_H__
#define __MSP_H__


#ifdef   MSP_LOCAL
#define  EXT_MSP_DEF
#else
#define  EXT_MSP_DEF     extern
#endif





#include "Hw.h"
#include "Ap_Define.h"
#include "Lb_Util.h"




#define MSP_SET_RAW_RC_TINY      150   //in message          4 rc chan
#define MSP_ARM                  151
#define MSP_DISARM               152
#define MSP_TRIM_UP              153
#define MSP_TRIM_DOWN            154
#define MSP_TRIM_LEFT            155
#define MSP_TRIM_RIGHT           156

#define MSP_TRIM_UP_FAST         157
#define MSP_TRIM_DOWN_FAST       158
#define MSP_TRIM_LEFT_FAST       159
#define MSP_TRIM_RIGHT_FAST      160

#define MSP_READ_TEST_PARAM      189
#define MSP_SET_TEST_PARAM       190

#define MSP_READ_TEST_PARAM      189
#define MSP_HEX_NANO             199



#define MSP_CMD_MAX_LENGTH		64


typedef struct
{
	uint8_t	Cmd;
	uint8_t	Length;
	uint8_t CheckSum;
	uint8_t	Data[MSP_CMD_MAX_LENGTH];
} MSP_CMD_OBJ;


typedef struct
{
	uint8_t	Cmd;
	uint8_t	Length;
	uint8_t ErrorCode;
	uint8_t CheckSum;
	uint8_t	Data[MSP_CMD_MAX_LENGTH];
} MSP_RESP_OBJ;


typedef struct
{
    int16_t Roll;
    int16_t Pitch;
    int16_t Yaw;
    int16_t Throthle;
} MSP_CMD_RC_OBJ;







EXT_MSP_DEF void MSP_Init( void );
EXT_MSP_DEF BOOL MSP_GetReceived( void );

EXT_MSP_DEF MSP_CMD_OBJ  *MSP_Get_CmdPtr( void );
EXT_MSP_DEF MSP_RESP_OBJ *MSP_Get_RespPtr( void );

EXT_MSP_DEF MSP_CMD_RC_OBJ *MSP_Get_CmdRcPtr( void );


EXT_MSP_DEF void MSP_SendResp( MSP_RESP_OBJ *pResp );


#endif
