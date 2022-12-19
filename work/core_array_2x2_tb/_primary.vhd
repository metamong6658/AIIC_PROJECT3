library verilog;
use verilog.vl_types.all;
entity core_array_2x2_tb is
    generic(
        data_size       : integer := 8;
        mask_cnt_delay  : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_size : constant is 1;
    attribute mti_svvh_generic_type of mask_cnt_delay : constant is 1;
end core_array_2x2_tb;
