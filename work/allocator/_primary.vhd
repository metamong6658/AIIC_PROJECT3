library verilog;
use verilog.vl_types.all;
entity allocator is
    generic(
        data_size       : integer := 8;
        mask_cnt_init   : integer := 1;
        mask_cnt_delay  : integer := 1
    );
    port(
        empty           : in     vl_logic_vector(4 downto 0);
        request         : in     vl_logic_vector(4 downto 0);
        fill            : out    vl_logic_vector(4 downto 0);
        grant           : out    vl_logic_vector(4 downto 0);
        l_data_i        : in     vl_logic_vector;
        n_data_i        : in     vl_logic_vector;
        e_data_i        : in     vl_logic_vector;
        s_data_i        : in     vl_logic_vector;
        w_data_i        : in     vl_logic_vector;
        sel_data        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_size : constant is 1;
    attribute mti_svvh_generic_type of mask_cnt_init : constant is 1;
    attribute mti_svvh_generic_type of mask_cnt_delay : constant is 1;
end allocator;
