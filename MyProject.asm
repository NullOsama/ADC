
_main:

;MyProject.c,29 :: 		void main()
;MyProject.c,31 :: 		A0 = 1;
	BSF         RA0_bit+0, BitPos(RA0_bit+0) 
;MyProject.c,32 :: 		A1 = 1;
	BSF         RA1_bit+0, BitPos(RA1_bit+0) 
;MyProject.c,33 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,35 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,37 :: 		Lcd_Out(0, 5, "Hello!!");
	CLRF        FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,38 :: 		Delay_ms(1000);
	MOVLW       25
	MOVWF       R11, 0
	MOVLW       240
	MOVWF       R12, 0
	MOVLW       77
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;MyProject.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,43 :: 		do
L_main1:
;MyProject.c,45 :: 		adcResult0 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adcResult0+0 
	MOVF        R1, 0 
	MOVWF       _adcResult0+1 
;MyProject.c,46 :: 		adcResult1 = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+4 
	MOVF        R1, 0 
	MOVWF       FLOC__main+5 
	MOVF        FLOC__main+4, 0 
	MOVWF       _adcResult1+0 
	MOVF        FLOC__main+5, 0 
	MOVWF       _adcResult1+1 
;MyProject.c,48 :: 		measuredVoltage0 = (adcREsult0 * referanceVoltage) / 1024.0;
	MOVF        _adcResult0+0, 0 
	MOVWF       R0 
	MOVF        _adcResult0+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _measuredVoltage0+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _measuredVoltage0+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _measuredVoltage0+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _measuredVoltage0+3 
;MyProject.c,49 :: 		measuredVoltage1 = (adcREsult1 * referanceVoltage) / 1024.0;
	MOVF        FLOC__main+4, 0 
	MOVWF       R0 
	MOVF        FLOC__main+5, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _measuredVoltage1+0 
	MOVF        R1, 0 
	MOVWF       _measuredVoltage1+1 
	MOVF        R2, 0 
	MOVWF       _measuredVoltage1+2 
	MOVF        R3, 0 
	MOVWF       _measuredVoltage1+3 
;MyProject.c,52 :: 		FloatToStr(measuredVoltage0, measuredVoltageText0);
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _measuredVoltageText0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_measuredVoltageText0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,53 :: 		FloatToStr(measuredVoltage1, measuredVoltageText1);
	MOVF        _measuredVoltage1+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _measuredVoltage1+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _measuredVoltage1+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _measuredVoltage1+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _measuredVoltageText1+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_measuredVoltageText1+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,55 :: 		Lcd_Out(1, 1, "AN0: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,56 :: 		Lcd_Out(1, 5, measuredVoltageText0);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _measuredVoltageText0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_measuredVoltageText0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,57 :: 		Lcd_Out(1, 16, "V");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,59 :: 		Lcd_Out(2, 1, "AN1: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,60 :: 		Lcd_Out(2, 5, measuredVoltageText1);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _measuredVoltageText1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_measuredVoltageText1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,61 :: 		Lcd_Out(2, 16, "V");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,63 :: 		Delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       123
	MOVWF       R12, 0
	MOVLW       252
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;MyProject.c,65 :: 		}while(1);
	GOTO        L_main1
;MyProject.c,68 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
