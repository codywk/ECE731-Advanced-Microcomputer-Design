library verilog;
use verilog.vl_types.all;
entity QuadratureEncoderTop_vlg_check_tst is
    port(
        FwdBck          : in     vl_logic;
        Trvl            : in     vl_logic;
        encCount        : in     vl_logic_vector(25 downto 0);
        sampler_rx      : in     vl_logic
    );
end QuadratureEncoderTop_vlg_check_tst;
