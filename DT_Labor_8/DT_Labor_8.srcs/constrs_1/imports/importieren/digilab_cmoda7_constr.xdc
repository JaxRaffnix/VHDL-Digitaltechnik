#########################################################
## ON-BOARD ELEMENTE UND SIGNALE
##-------------------------------
## Dies sind die fest verbauten Buttons, LEDs sowie die
## Clock auf dem CMOD A7 Board
#########################################################

## 12 MHz Takt. Zum Verwenden, die beiden nachfolgenden Zeilen entkommentieren!
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { sysclk }]; #On-Board Oszillator
create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports {sysclk}]; #Timing-Constraint fuer Takt

## On-Board LEDs
#set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #LED ld1
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #LED ld2

## On-Board RGB LED
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { led0_b }]; #LED ld0 - blauer Kanal
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { led0_g }]; #LED ld0 - gruener Kanal
#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { led0_r }]; #LED ld0 - roter Kanal

## On-Board Buttons
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { btn0 }]; #Button bnt0
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {btn0_IBUF}]; #WICHTIG: WIRD FUER VERSUCH 2 BENOETIGT. Schema <BUTTON-SIGNAL>_IBUF beachten!
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { btn1 }]; #Button btn1
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {btn1_IBUF}]; #WICHTIG: WIRD FUER VERSUCH 2 BENOETIGT. Schema <BUTTON-SIGNAL>_IBUF beachten!

#########################################################
## GPIO PINS
##-----------
## Dies sind die Allzweck-I/O Pins des CMOD A7 Boards
## zum Anschluss externer Peripherie
#########################################################

##-------------------
## Gruene Gruppe
## Pins 1-8
##-------------------
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { opt_switch[0]  }]; #GPIO Pin 01
set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { opt_switch[1]  }]; #GPIO Pin 02
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { segments_L[0]  }]; #GPIO Pin 03
set_property -dict { PACKAGE_PIN K3    IOSTANDARD LVCMOS33 } [get_ports { segments_L[1]  }]; #GPIO Pin 04
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { segments_L[2]  }]; #GPIO Pin 05
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { segments_L[3]  }]; #GPIO Pin 06
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { segments_L[4]  }]; #GPIO Pin 07
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports { segments_L[5]  }]; #GPIO Pin 08

##-------------------
## Rote Gruppe
## Pins 9-16
## ACHTUNG: Pins 15 und 16 sind spezielle Eingaenge fuer den Analog-Digital-Wandler und koennen nicht als I/O verwendet werden.
##-------------------
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { segments_L[6]  }]; #GPIO Pin 09
#set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { pio10 }]; #GPIO Pin 10
#set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { pio11 }]; #GPIO Pin 11
#set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { pio12 }]; #GPIO Pin 12
#set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { pio13 }]; #GPIO Pin 13
#set_property -dict { PACKAGE_PIN L2    IOSTANDARD LVCMOS33 } [get_ports { pio14 }]; #GPIO Pin 14

##-------------------
## Pinke Gruppe
## Pins 41-48
##-------------------
#set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports { pio41 }]; #GPIO Pin 41
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { segments_H[6] }]; #GPIO Pin 42
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { segments_H[5] }]; #GPIO Pin 43
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { segments_H[4] }]; #GPIO Pin 44
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { segments_H[3] }]; #GPIO Pin 45
set_property -dict { PACKAGE_PIN W7    IOSTANDARD LVCMOS33 } [get_ports { segments_H[2] }]; #GPIO Pin 46
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { segments_H[1] }]; #GPIO Pin 47
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { segments_H[0] }]; #GPIO Pin 48
