#line 1 "C:/Users/aaxxo/Desktop/ADC/MyProject.c"
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;

sbit A0 at RA0_bit;
sbit A1 at RA1_bit;

unsigned int adcResult0 = 0;
float measuredVoltage0;
char measuredVoltageText0[15];

unsigned int adcResult1 = 0;
float measuredVoltage1;
char measuredVoltageText1[15];




void main()
{
 A0 = 1;
 A1 = 1;
 ADC_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(0, 5, "Hello!!");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 do
 {
 adcResult0 = ADC_Read(0);
 adcResult1 = ADC_Read(1);

 measuredVoltage0 = (adcREsult0 *  5.00 ) / 1024.0;
 measuredVoltage1 = (adcREsult1 *  5.00 ) / 1024.0;


 FloatToStr(measuredVoltage0, measuredVoltageText0);
 FloatToStr(measuredVoltage1, measuredVoltageText1);

 Lcd_Out(1, 1, "AN0: ");
 Lcd_Out(1, 5, measuredVoltageText0);
 Lcd_Out(1, 16, "V");

 Lcd_Out(2, 1, "AN1: ");
 Lcd_Out(2, 5, measuredVoltageText1);
 Lcd_Out(2, 16, "V");

 Delay_ms(300);

 }while(1);


}
