library verilog;
use verilog.vl_types.all;
entity QuadratureEncoderTop_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end QuadratureEncoderTop_vlg_sample_tst;
