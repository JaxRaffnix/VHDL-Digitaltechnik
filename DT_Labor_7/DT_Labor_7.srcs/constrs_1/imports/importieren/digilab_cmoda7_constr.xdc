
## 12 MHz Takt. Zum Verwenden, die beiden nachfolgenden Zeilen entkommentieren!
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { sysclk }]; #On-Board Oszillator
create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports { sysclk }]; #Timing-Constraint fuer Takt

## On-Board Buttons
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { btn0 }]; #Button bnt0
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {btn0_IBUF}]; #WICHTIG: WIRD FUER VERSUCH 2 BENOETIGT. Schema <BUTTON-SIGNAL>_IBUF beachten!
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { btn1 }]; #Button btn1
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {btn1_IBUF}]; #WICHTIG: WIRD FUER VERSUCH 2 BENOETIGT. Schema <BUTTON-SIGNAL>_IBUF beachten!

##-------------------
## Gruene Gruppe
## Pins 1-8
##-------------------
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { switch[0]  }]; #GPIO Pin 01
set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { switch[1]  }]; #GPIO Pin 02
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { switch[2]  }]; #GPIO Pin 03
set_property -dict { PACKAGE_PIN K3    IOSTANDARD LVCMOS33 } [get_ports { switch[3]  }]; #GPIO Pin 04
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { pio5  }]; #GPIO Pin 05
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { pio6  }]; #GPIO Pin 06
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { pio7  }]; #GPIO Pin 07
#set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports { pio8  }]; #GPIO Pin 08

##-------------------
## Pinke Gruppe
## Pins 41-48
##-------------------
#set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports {  }]; #GPIO Pin 41
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { segments[6] }]; #GPIO Pin 42
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { segments[5] }]; #GPIO Pin 43
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { segments[4] }]; #GPIO Pin 44
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { segments[3] }]; #GPIO Pin 45
set_property -dict { PACKAGE_PIN W7    IOSTANDARD LVCMOS33 } [get_ports { segments[2] }]; #GPIO Pin 46
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { segments[1] }]; #GPIO Pin 47
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { segments[0] }]; #GPIO Pin 48
