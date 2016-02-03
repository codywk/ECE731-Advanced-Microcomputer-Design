library verilog;
use verilog.vl_types.all;
entity EncoderPulseCounterTop is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        count           : out    vl_logic_vector(7 downto 0)
    );
end EncoderPulseCounterTop;
