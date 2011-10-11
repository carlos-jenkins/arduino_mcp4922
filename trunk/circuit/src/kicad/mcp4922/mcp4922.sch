EESchema Schematic File Version 2  date lun 10 oct 2011 18:24:56 CST
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:mcp4922-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "MCP4922 Example Circuit"
Date "11 oct 2011"
Rev "1.0"
Comp "Carlos Jenkins"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Notes Line
	9400 2400 6150 2400
Wire Notes Line
	9400 2400 9400 5000
Wire Notes Line
	9400 5000 6150 5000
Wire Notes Line
	6150 5000 6150 2400
Connection ~ 9200 3600
Wire Wire Line
	9200 3650 9200 3400
Wire Wire Line
	9200 3400 9000 3400
Wire Wire Line
	7450 4800 8250 4800
Wire Wire Line
	8250 4800 8250 3400
Wire Wire Line
	8650 4000 8100 4000
Connection ~ 8500 3500
Wire Wire Line
	8100 3700 8500 3700
Connection ~ 6900 2900
Wire Wire Line
	6900 2850 6900 3400
Wire Wire Line
	7000 3800 6600 3800
Wire Wire Line
	3750 2600 3750 2200
Wire Wire Line
	3450 2600 3450 2200
Wire Wire Line
	4050 2600 4050 2200
Wire Wire Line
	3550 2600 3550 2200
Wire Wire Line
	7000 3700 6600 3700
Wire Wire Line
	7000 3600 6600 3600
Wire Wire Line
	6900 3400 7000 3400
Wire Wire Line
	9200 3600 8100 3600
Wire Wire Line
	8100 3500 8500 3500
Wire Wire Line
	3950 2600 3950 2200
Wire Wire Line
	8400 2900 8400 3900
Wire Wire Line
	8400 3900 8100 3900
Connection ~ 8400 2900
Wire Wire Line
	8600 3400 8500 3400
Wire Wire Line
	8500 3400 8500 3700
Wire Wire Line
	6900 2900 8500 2900
Wire Wire Line
	8250 3400 8100 3400
Wire Wire Line
	8100 3800 8150 3800
Wire Wire Line
	8150 3800 8150 4400
Wire Wire Line
	8150 4400 7450 4400
Wire Wire Line
	6500 3400 6400 3400
Wire Wire Line
	6400 3400 6400 3550
$Comp
L C C1
U 1 1 4E938BA1
P 6700 3400
F 0 "C1" V 6750 3500 50  0000 L CNN
F 1 "0.1uF" V 6600 3550 50  0000 L CNN
	1    6700 3400
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 4E938B3A
P 8800 3400
F 0 "C2" V 8850 3500 50  0000 L CNN
F 1 "0.1uF" V 8700 3550 50  0000 L CNN
	1    8800 3400
	0    1    1    0   
$EndComp
NoConn ~ 7000 3500
Text Notes 3850 2550 1    21   ~ 0
D10 & D04 for Ethernet shield (untested)
Text Label 4050 2500 1    60   ~ 0
LDAC
Text Label 7500 4400 0    60   ~ 0
OUT_B
Text Label 7500 4800 0    60   ~ 0
OUT_A
NoConn ~ 7000 4000
NoConn ~ 7000 3900
NoConn ~ 3650 2600
NoConn ~ 3850 2600
Text Notes 7150 2650 0    99   ~ 0
Analog output
$Comp
L GND #PWR1
U 1 1 4D945226
P 6400 3550
F 0 "#PWR1" H 6400 3550 30  0001 C CNN
F 1 "GND" H 6400 3480 30  0001 C CNN
	1    6400 3550
	1    0    0    -1  
$EndComp
Text Label 8450 4000 0    60   ~ 0
LDAC
$Comp
L R R1
U 1 1 4D945028
P 8500 3150
F 0 "R1" V 8580 3150 50  0000 C CNN
F 1 "100K" V 8500 3150 50  0000 C CNN
	1    8500 3150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR2
U 1 1 4D944FBE
P 6900 2850
F 0 "#PWR2" H 6900 2940 20  0001 C CNN
F 1 "+5V" H 6900 2940 30  0000 C CNN
	1    6900 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 4D944FB0
P 9200 3650
F 0 "#PWR3" H 9200 3650 30  0001 C CNN
F 1 "GND" H 9200 3580 30  0001 C CNN
	1    9200 3650
	1    0    0    -1  
$EndComp
Text Label 6650 3800 0    60   ~ 0
SDI
Text Label 6650 3700 0    60   ~ 0
SCK
Text Label 6650 3600 0    60   ~ 0
CS
Text Label 3550 2500 1    60   ~ 0
SCK
Text Label 3750 2500 1    60   ~ 0
SDI
Text Label 3950 2500 1    60   ~ 0
CS
$Comp
L MCP4922 U1
U 1 1 4D944D78
P 7550 3700
F 0 "U1" H 7550 3250 60  0000 C CNN
F 1 "MCP4922" H 7550 4100 60  0000 C CNN
	1    7550 3700
	1    0    0    -1  
$EndComp
$Comp
L ARDUINOUNO A1
U 1 1 4D922943
P 3750 3700
F 0 "A1" H 4300 3400 60  0000 C CNN
F 1 "ARDUINOUNO" H 3800 3400 60  0000 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
