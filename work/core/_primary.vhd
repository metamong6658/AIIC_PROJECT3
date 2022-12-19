library verilog;
use verilog.vl_types.all;
entity core is
    generic(
        data_size       : integer := 8;
        mask_cnt_init   : integer := 1;
        mask_cnt_delay  : integer := 1
    );
    port(
        n_fill_i        : in     vl_logic;
        n_empty_i       : in     vl_logic;
        n_data_i        : in     vl_logic_vector;
        n_fill_o        : out    vl_logic;
        n_empty_o       : out    vl_logic;
        n_data_o        : out    vl_logic_vector;
        e_fill_i        : in     vl_logic;
        e_empty_i       : in     vl_logic;
        e_data_i        : in     vl_logic_vector;
        e_fill_o        : out    vl_logic;
        e_empty_o       : out    vl_logic;
        e_data_o        : out    vl_logic_vector;
        s_fill_i        : in     vl_logic;
        s_empty_i       : in     vl_logic;
        s_data_i        : in     vl_logic_vector;
        s_fill_o        : out    vl_logic;
        s_empty_o       : out    vl_logic;
        s_data_o        : out    vl_logic_vector;
        w_fill_i        : in     vl_logic;
        w_empty_i       : in     vl_logic;
        w_data_i        : in     vl_logic_vector;
        w_fill_o        : out    vl_logic;
        w_empty_o       : out    vl_logic;
        w_data_o        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_size : constant is 1;
    attribute mti_svvh_generic_type of mask_cnt_init : constant is 1;
    attribute mti_svvh_generic_type of mask_cnt_delay : constant is 1;
end core;
