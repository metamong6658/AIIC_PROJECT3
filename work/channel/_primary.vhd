library verilog;
use verilog.vl_types.all;
entity channel is
    generic(
        data_size       : integer := 8;
        is_local        : integer := 1
    );
    port(
        fill            : in     vl_logic;
        grant           : in     vl_logic;
        request         : out    vl_logic;
        empty           : out    vl_logic;
        i_data          : in     vl_logic_vector;
        o_data          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_size : constant is 1;
    attribute mti_svvh_generic_type of is_local : constant is 1;
end channel;
