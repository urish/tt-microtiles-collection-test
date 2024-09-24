library ieee;
use ieee.std_logic_1164.all;

entity sky130_fd_sc_hd_dlygate4sd3_1 is
    port (
        A: in std_logic;
        X: out std_logic
    );
end entity sky130_fd_sc_hd_dlygate4sd3_1;

architecture sim of sky130_fd_sc_hd_dlygate4sd3_1 is
begin
    X <= A after 375 ps;
end architecture sim;
