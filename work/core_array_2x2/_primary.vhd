library verilog;
use verilog.vl_types.all;
entity core_array_2x2 is
    generic(
        data_size       : integer := 8;
        mask_cnt_delay  : integer := 1
    );
    port(
        i_data1         : in     vl_logic_vector;
        fill1           : in     vl_logic;
        i_data2         : in     vl_logic_vector;
        fill2           : in     vl_logic;
        o_data1         : out    vl_logic_vector;
        o_data2         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_size : constant is 1;
    attribute mti_svvh_generic_type of mask_cnt_delay : constant is 1;
end core_array_2x2;
