//----------------------------------------------------------------------------
//    프로그램명 	: MSP 함수
//
//    만든이     	:
//
//    날  짜     	:
//    
//    최종 수정  	:
//
//    MPU_Type		:
//
//    파일명     	: Ap.c
//----------------------------------------------------------------------------


//----- 헤더파일 열기
//
#define  MSP_LOCAL

#include "MSP.h"





//-- 내부 정의
//
#define MSP_CMD_START						'$'
#define MSP_CMD_HEADER_M					'M'
#define MSP_CMD_HEADER_ARROW 				'<'



#define MSP_CMD_STATE_WAIT_START			0
#define MSP_CMD_STATE_WAIT_HEADER_M			1
#define MSP_CMD_STATE_WAIT_HEADER_ARROW		2
#define MSP_CMD_STATE_WAIT_DATA_SIZE		3
#define MSP_CMD_STATE_WAIT_CMD				4
#define MSP_CMD_STATE_WAIT_DATA				5
#define MSP_CMD_STATE_WAIT_CHECKSUM			6



//-- 내부 함수
//
static MSP_CMD_OBJ		Cmd;
static MSP_RESP_OBJ		Resp;


static uint8_t  Cmd_State;
static uint8_t  Index_Data;

static uint32_t CurrentTime;
static uint32_t PreviousTime;

static BOOL     CmdReceived;



//-- 내부 함수
//
BOOL MSP_Update( uint8_t ch );





/*---------------------------------------------------------------------------
     TITLE   : MSP_Init
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void MSP_ISR(char Ch)
{
	BOOL Ret;

	Ret = MSP_Update(Ch);

	if( Ret == TRUE && CmdReceived == FALSE )
	{
		CmdReceived = TRUE;
	}
}




/*---------------------------------------------------------------------------
     TITLE   : MSP_Init
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void MSP_Init( void )
{
	CmdReceived = FALSE;
	Cmd_State   = MSP_CMD_STATE_WAIT_START;

	Hw_Uart_SetReceiveFuncISR( HW_UART_CH_MSP, MSP_ISR );
}





/*---------------------------------------------------------------------------
     TITLE   : MSP_GetReceived
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
BOOL MSP_GetReceived( void )
{
	BOOL Ret;

	Ret = CmdReceived;
	CmdReceived = FALSE;

	return Ret;
}





/*---------------------------------------------------------------------------
     TITLE   : MSP_Update
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
BOOL MSP_Update( uint8_t ch )
{
	BOOL Ret = FALSE;



	//-- 바이트간 타임아웃 설정(200ms)
	//
	CurrentTime = micros();

	if( (CurrentTime - PreviousTime) > 200000 )
	{
		Cmd_State    = MSP_CMD_STATE_WAIT_START;
		PreviousTime = CurrentTime;
	}



	//-- 명령어 상태
	//
	switch( Cmd_State )
	{

		//-- 시작 문자 기다리는 상태
		//
		case MSP_CMD_STATE_WAIT_START:

			// 시작 문자를 기다림
			if( ch == MSP_CMD_START )
			{
				Cmd_State    = MSP_CMD_STATE_WAIT_HEADER_M;
			}
			break;


		//-- 'M' 기다리는 상태
		//
		case MSP_CMD_STATE_WAIT_HEADER_M:
			if( ch == MSP_CMD_HEADER_M )
			{
				Cmd_State = MSP_CMD_STATE_WAIT_HEADER_ARROW;
			}
			else
			{
				Cmd_State = MSP_CMD_STATE_WAIT_START;
			}
			break;


		//-- '<' 기다리는 상태
		//
		case MSP_CMD_STATE_WAIT_HEADER_ARROW:
			if( ch == MSP_CMD_HEADER_ARROW )
			{
				Cmd.CheckSum = 0x00;
				Cmd.Length   = 0;
				Cmd_State = MSP_CMD_STATE_WAIT_DATA_SIZE;
			}
			else
			{
				Cmd_State = MSP_CMD_STATE_WAIT_START;
			}
			break;


				Cmd.CheckSum = 0x00;
				Cmd.Length   = 0;


		//-- 데이터 사이즈 기다리는 상태(64까지)
		//
		case MSP_CMD_STATE_WAIT_DATA_SIZE:

			if( ch <= MSP_CMD_MAX_LENGTH )
			{
				Cmd.Length    = ch;
				Index_Data    = 0;
				Cmd.CheckSum ^= ch;
				Cmd_State     = MSP_CMD_STATE_WAIT_CMD;
			}
			else
			{
				Cmd_State = MSP_CMD_STATE_WAIT_START;
			}
			break;


		//-- 명령어를 기다리는 상태
		//
		case MSP_CMD_STATE_WAIT_CMD:

			Cmd.Cmd       = ch;
			Cmd.CheckSum ^= ch;

			if( Cmd.Length == 0 )
			{
				Cmd_State = MSP_CMD_STATE_WAIT_CHECKSUM;
			}
			else
			{
				Cmd_State = MSP_CMD_STATE_WAIT_DATA;
			}
			break;


		//-- 데이터를 기다리는 상태
		//
		case MSP_CMD_STATE_WAIT_DATA:

			Cmd.CheckSum          ^= ch;
			Cmd.Data[ Index_Data ] = ch;

			Index_Data++;

			if( Index_Data >= Cmd.Length )
			{
				Cmd_State = MSP_CMD_STATE_WAIT_CHECKSUM;
			}
			break;


		//-- 체크섬을 기다리는 상태
		//
		case MSP_CMD_STATE_WAIT_CHECKSUM:

			if( Cmd.CheckSum == ch )
			{
				Ret = TRUE;
			}

			Cmd_State = MSP_CMD_STATE_WAIT_START;
			break;
	}

	return Ret;
}





/*---------------------------------------------------------------------------
     TITLE   : MSP_Get_CmdPtr
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
MSP_CMD_OBJ *MSP_Get_CmdPtr( void )
{
	return &Cmd;
}





/*---------------------------------------------------------------------------
     TITLE   : MSP_Get_RespPtr
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
MSP_RESP_OBJ *MSP_Get_RespPtr( void )
{
	return &Resp;
}








/*---------------------------------------------------------------------------
     TITLE   : MSP_Get_CmdRcPtr
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
MSP_CMD_RC_OBJ *MSP_Get_CmdRcPtr( void )
{
	static MSP_CMD_RC_OBJ RcCmd;
	MSP_CMD_OBJ *pCmd = &Cmd;


	RcCmd.Roll     = pCmd->Data[0] * 4 - 500;
	RcCmd.Pitch    = pCmd->Data[1] * 4 - 500;
	RcCmd.Yaw      = pCmd->Data[2] * 4 - 500;
	RcCmd.Throthle = pCmd->Data[3] * 4;


	return &RcCmd;
}





/*---------------------------------------------------------------------------
     TITLE   : MSP_SendResp
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void MSP_SendResp( MSP_RESP_OBJ *pResp )
{
	uint8_t i;
	uint8_t CheckSum = 0;


	Hw_Uart_Putch(HW_UART_CH_MSP, MSP_CMD_START );
	Hw_Uart_Putch(HW_UART_CH_MSP, MSP_CMD_HEADER_M );

	if( pResp->ErrorCode > 0 )	Hw_Uart_Putch(HW_UART_CH_MSP, '!');
	else						Hw_Uart_Putch(HW_UART_CH_MSP, '>');

	Hw_Uart_Putch(HW_UART_CH_MSP, pResp->Length );
	Hw_Uart_Putch(HW_UART_CH_MSP, pResp->Cmd );
	CheckSum ^= pResp->Cmd;

	for( i=0; i<pResp->Length; i++ )
	{
		Hw_Uart_Putch( HW_UART_CH_MSP, pResp->Data[i] );
		CheckSum ^= pResp->Data[i];
	}

	Hw_Uart_Putch(HW_UART_CH_MSP, CheckSum );
}





 
