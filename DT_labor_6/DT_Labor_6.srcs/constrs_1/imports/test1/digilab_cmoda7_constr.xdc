## On-Board LEDs
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { led[4] }]; #LED ld1

## On-Board Buttons
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { btn0 }]; #Button bnt0
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {btn0_IBUF}]; #WICHTIG: WIRD FUER VERSUCH 2 BENOETIGT. Schema <BUTTON-SIGNAL>_IBUF beachten!
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { btn1 }]; #Button btn1
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {btn1_IBUF}]; #WICHTIG: WIRD FUER VERSUCH 2 BENOETIGT. Schema <BUTTON-SIGNAL>_IBUF beachten!

##-------------------
## Gruene Gruppe
## Pins 1-8
##-------------------
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { led[0]  }]; #GPIO Pin 01
set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { led[1]  }]; #GPIO Pin 02
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { led[2]  }]; #GPIO Pin 03
set_property -dict { PACKAGE_PIN K3    IOSTANDARD LVCMOS33 } [get_ports { led[3]  }]; #GPIO Pin 04
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { switch[0]  }]; #GPIO Pin 05
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { switch[1]  }]; #GPIO Pin 06
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { switch[2]  }]; #GPIO Pin 07
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports { switch[3]  }]; #GPIO Pin 08
