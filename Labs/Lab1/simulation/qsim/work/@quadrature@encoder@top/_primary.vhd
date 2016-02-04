library verilog;
use verilog.vl_types.all;
entity QuadratureEncoderTop is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        Trvl            : out    vl_logic;
        FwdBck          : out    vl_logic;
        encCount        : out    vl_logic_vector(25 downto 0);
        forward         : out    vl_logic_vector(37 downto 0);
        back            : out    vl_logic_vector(37 downto 0);
        mid             : out    vl_logic_vector(37 downto 0)
    );
end QuadratureEncoderTop;
