-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Wed Jun 22 22:14:01 2022
-- Host        : Jan-Convertible running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Nutzer/Workspace/Coding/VHDL/DT_Labor_8/DT_Labor_8.sim/statemachine_sim/synth/func/xsim/statemachine_tb_func_synth.vhd
-- Design      : top_level
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a15tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decade_counter is
  port (
    segments_H_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    dir_internal : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decade_counter;

architecture STRUCTURE of decade_counter is
  signal bcd : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal next_bcd : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bcd[1]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bcd[2]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bcd[3]_i_2__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \segments_H_OBUF[0]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \segments_H_OBUF[1]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \segments_H_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \segments_H_OBUF[3]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \segments_H_OBUF[4]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \segments_H_OBUF[5]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \segments_H_OBUF[6]_inst_i_1\ : label is "soft_lutpair2";
begin
\bcd[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bcd(0),
      O => next_bcd(0)
    );
\bcd[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55A2AA54"
    )
        port map (
      I0 => dir_internal,
      I1 => bcd(3),
      I2 => bcd(2),
      I3 => bcd(1),
      I4 => bcd(0),
      O => next_bcd(1)
    );
\bcd[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5AF0F0A4"
    )
        port map (
      I0 => dir_internal,
      I1 => bcd(3),
      I2 => bcd(2),
      I3 => bcd(0),
      I4 => bcd(1),
      O => next_bcd(2)
    );
\bcd[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCC4C9"
    )
        port map (
      I0 => dir_internal,
      I1 => bcd(3),
      I2 => bcd(1),
      I3 => bcd(0),
      I4 => bcd(2),
      O => next_bcd(3)
    );
\bcd_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => next_bcd(0),
      Q => bcd(0)
    );
\bcd_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => next_bcd(1),
      Q => bcd(1)
    );
\bcd_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => next_bcd(2),
      Q => bcd(2)
    );
\bcd_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => next_bcd(3),
      Q => bcd(3)
    );
\segments_H_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"155A"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(0),
      I2 => bcd(2),
      I3 => bcd(1),
      O => segments_H_OBUF(0)
    );
\segments_H_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0647"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(1),
      I3 => bcd(0),
      O => segments_H_OBUF(1)
    );
\segments_H_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0047"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(1),
      I2 => bcd(2),
      I3 => bcd(0),
      O => segments_H_OBUF(2)
    );
\segments_H_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1453"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(1),
      I3 => bcd(0),
      O => segments_H_OBUF(3)
    );
\segments_H_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5747"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(1),
      I3 => bcd(0),
      O => segments_H_OBUF(4)
    );
\segments_H_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"415F"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(0),
      I2 => bcd(1),
      I3 => bcd(2),
      O => segments_H_OBUF(5)
    );
\segments_H_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5613"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(1),
      I3 => bcd(0),
      O => segments_H_OBUF(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decade_counter_0 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    segments_L_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    dir_internal : in STD_LOGIC;
    \bcd_reg[3]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decade_counter_0 : entity is "decade_counter";
end decade_counter_0;

architecture STRUCTURE of decade_counter_0 is
  signal \bcd_reg_n_0_[0]\ : STD_LOGIC;
  signal \bcd_reg_n_0_[1]\ : STD_LOGIC;
  signal \bcd_reg_n_0_[2]\ : STD_LOGIC;
  signal \bcd_reg_n_0_[3]\ : STD_LOGIC;
  signal next_bcd : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bcd[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bcd[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bcd[3]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \segments_L_OBUF[0]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \segments_L_OBUF[1]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \segments_L_OBUF[2]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \segments_L_OBUF[3]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \segments_L_OBUF[4]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \segments_L_OBUF[5]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \segments_L_OBUF[6]_inst_i_1\ : label is "soft_lutpair7";
begin
\bcd[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \bcd_reg_n_0_[0]\,
      O => next_bcd(0)
    );
\bcd[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55A2AA54"
    )
        port map (
      I0 => dir_internal,
      I1 => \bcd_reg_n_0_[3]\,
      I2 => \bcd_reg_n_0_[2]\,
      I3 => \bcd_reg_n_0_[1]\,
      I4 => \bcd_reg_n_0_[0]\,
      O => next_bcd(1)
    );
\bcd[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5AF0F0A4"
    )
        port map (
      I0 => dir_internal,
      I1 => \bcd_reg_n_0_[3]\,
      I2 => \bcd_reg_n_0_[2]\,
      I3 => \bcd_reg_n_0_[0]\,
      I4 => \bcd_reg_n_0_[1]\,
      O => next_bcd(2)
    );
\bcd[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000100000000"
    )
        port map (
      I0 => \bcd_reg_n_0_[0]\,
      I1 => \bcd_reg_n_0_[1]\,
      I2 => \bcd_reg_n_0_[3]\,
      I3 => \bcd_reg_n_0_[2]\,
      I4 => dir_internal,
      I5 => \bcd_reg[3]_0\(0),
      O => E(0)
    );
\bcd[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCC4C9"
    )
        port map (
      I0 => dir_internal,
      I1 => \bcd_reg_n_0_[3]\,
      I2 => \bcd_reg_n_0_[1]\,
      I3 => \bcd_reg_n_0_[0]\,
      I4 => \bcd_reg_n_0_[2]\,
      O => next_bcd(3)
    );
\bcd_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \bcd_reg[3]_0\(0),
      CLR => AR(0),
      D => next_bcd(0),
      Q => \bcd_reg_n_0_[0]\
    );
\bcd_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \bcd_reg[3]_0\(0),
      CLR => AR(0),
      D => next_bcd(1),
      Q => \bcd_reg_n_0_[1]\
    );
\bcd_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \bcd_reg[3]_0\(0),
      CLR => AR(0),
      D => next_bcd(2),
      Q => \bcd_reg_n_0_[2]\
    );
\bcd_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \bcd_reg[3]_0\(0),
      CLR => AR(0),
      D => next_bcd(3),
      Q => \bcd_reg_n_0_[3]\
    );
\segments_L_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"155A"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[0]\,
      I2 => \bcd_reg_n_0_[2]\,
      I3 => \bcd_reg_n_0_[1]\,
      O => segments_L_OBUF(0)
    );
\segments_L_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0647"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[2]\,
      I2 => \bcd_reg_n_0_[1]\,
      I3 => \bcd_reg_n_0_[0]\,
      O => segments_L_OBUF(1)
    );
\segments_L_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0047"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[1]\,
      I2 => \bcd_reg_n_0_[2]\,
      I3 => \bcd_reg_n_0_[0]\,
      O => segments_L_OBUF(2)
    );
\segments_L_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1453"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[2]\,
      I2 => \bcd_reg_n_0_[1]\,
      I3 => \bcd_reg_n_0_[0]\,
      O => segments_L_OBUF(3)
    );
\segments_L_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5747"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[2]\,
      I2 => \bcd_reg_n_0_[1]\,
      I3 => \bcd_reg_n_0_[0]\,
      O => segments_L_OBUF(4)
    );
\segments_L_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"415F"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[0]\,
      I2 => \bcd_reg_n_0_[1]\,
      I3 => \bcd_reg_n_0_[2]\,
      O => segments_L_OBUF(5)
    );
\segments_L_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5613"
    )
        port map (
      I0 => \bcd_reg_n_0_[3]\,
      I1 => \bcd_reg_n_0_[2]\,
      I2 => \bcd_reg_n_0_[1]\,
      I3 => \bcd_reg_n_0_[0]\,
      O => segments_L_OBUF(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity input_synchronizer is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC
  );
end input_synchronizer;

architecture STRUCTURE of input_synchronizer is
  signal data_metastable : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
\data_metastable_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(0),
      Q => data_metastable(0),
      R => '0'
    );
\data_metastable_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(1),
      Q => data_metastable(1),
      R => '0'
    );
\data_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => data_metastable(0),
      Q => Q(0),
      R => '0'
    );
\data_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => data_metastable(1),
      Q => Q(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity statemachine is
  port (
    dir_internal : out STD_LOGIC;
    \FSM_sequential_state_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end statemachine;

architecture STRUCTURE of statemachine is
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \next_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair11";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "forw2:010,forw1:001,back2:100,idle:000,back1:011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "forw2:010,forw1:001,back2:100,idle:000,back1:011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "forw2:010,forw1:001,back2:100,idle:000,back1:011";
  attribute SOFT_HLUTNM of \bcd[3]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \bcd[3]_i_3\ : label is "soft_lutpair10";
begin
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202475"
    )
        port map (
      I0 => state(2),
      I1 => Q(0),
      I2 => Q(1),
      I3 => state(1),
      I4 => state(0),
      O => \next_state__0\(0)
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20207471"
    )
        port map (
      I0 => state(2),
      I1 => Q(0),
      I2 => Q(1),
      I3 => state(0),
      I4 => state(1),
      O => \next_state__0\(1)
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00BB45FE"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(0),
      I3 => Q(0),
      I4 => Q(1),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A800"
    )
        port map (
      I0 => state(0),
      I1 => Q(1),
      I2 => Q(0),
      I3 => state(1),
      I4 => state(2),
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_state[2]_i_1_n_0\,
      CLR => AR(0),
      D => \next_state__0\(0),
      Q => state(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_state[2]_i_1_n_0\,
      CLR => AR(0),
      D => \next_state__0\(1),
      Q => state(1)
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_sequential_state[2]_i_1_n_0\,
      CLR => AR(0),
      D => \FSM_sequential_state[2]_i_2_n_0\,
      Q => state(2)
    );
\bcd[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010100"
    )
        port map (
      I0 => state(0),
      I1 => Q(1),
      I2 => Q(0),
      I3 => state(2),
      I4 => state(1),
      O => \FSM_sequential_state_reg[0]_0\(0)
    );
\bcd[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00545504"
    )
        port map (
      I0 => state(2),
      I1 => Q(0),
      I2 => Q(1),
      I3 => state(1),
      I4 => state(0),
      O => dir_internal
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_level is
  port (
    segments_H : out STD_LOGIC_VECTOR ( 6 downto 0 );
    segments_L : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sysclk : in STD_LOGIC;
    btn0 : in STD_LOGIC;
    opt_switch : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_level : entity is true;
end top_level;

architecture STRUCTURE of top_level is
  signal btn0_IBUF : STD_LOGIC;
  signal cnt_pulse_internal : STD_LOGIC;
  signal dir_internal : STD_LOGIC;
  signal opt_switch_IBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ripple_internal : STD_LOGIC;
  signal s_synchronized : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal segments_H_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal segments_L_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal sysclk_IBUF : STD_LOGIC;
  signal sysclk_IBUF_BUFG : STD_LOGIC;
begin
COUNTER_HIGH: entity work.decade_counter
     port map (
      AR(0) => btn0_IBUF,
      CLK => sysclk_IBUF_BUFG,
      E(0) => ripple_internal,
      dir_internal => dir_internal,
      segments_H_OBUF(6 downto 0) => segments_H_OBUF(6 downto 0)
    );
COUNTER_LOW: entity work.decade_counter_0
     port map (
      AR(0) => btn0_IBUF,
      CLK => sysclk_IBUF_BUFG,
      E(0) => ripple_internal,
      \bcd_reg[3]_0\(0) => cnt_pulse_internal,
      dir_internal => dir_internal,
      segments_L_OBUF(6 downto 0) => segments_L_OBUF(6 downto 0)
    );
FSM_INSTANCE: entity work.statemachine
     port map (
      AR(0) => btn0_IBUF,
      CLK => sysclk_IBUF_BUFG,
      \FSM_sequential_state_reg[0]_0\(0) => cnt_pulse_internal,
      Q(1 downto 0) => s_synchronized(1 downto 0),
      dir_internal => dir_internal
    );
S_SYNCHRONIZER: entity work.input_synchronizer
     port map (
      CLK => sysclk_IBUF_BUFG,
      D(1 downto 0) => opt_switch_IBUF(1 downto 0),
      Q(1 downto 0) => s_synchronized(1 downto 0)
    );
btn0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => btn0,
      O => btn0_IBUF
    );
\opt_switch_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opt_switch(0),
      O => opt_switch_IBUF(0)
    );
\opt_switch_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opt_switch(1),
      O => opt_switch_IBUF(1)
    );
\segments_H_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(0),
      O => segments_H(0)
    );
\segments_H_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(1),
      O => segments_H(1)
    );
\segments_H_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(2),
      O => segments_H(2)
    );
\segments_H_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(3),
      O => segments_H(3)
    );
\segments_H_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(4),
      O => segments_H(4)
    );
\segments_H_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(5),
      O => segments_H(5)
    );
\segments_H_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_H_OBUF(6),
      O => segments_H(6)
    );
\segments_L_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(0),
      O => segments_L(0)
    );
\segments_L_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(1),
      O => segments_L(1)
    );
\segments_L_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(2),
      O => segments_L(2)
    );
\segments_L_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(3),
      O => segments_L(3)
    );
\segments_L_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(4),
      O => segments_L(4)
    );
\segments_L_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(5),
      O => segments_L(5)
    );
\segments_L_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segments_L_OBUF(6),
      O => segments_L(6)
    );
sysclk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => sysclk_IBUF,
      O => sysclk_IBUF_BUFG
    );
sysclk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sysclk,
      O => sysclk_IBUF
    );
end STRUCTURE;
