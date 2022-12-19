library verilog;
use verilog.vl_types.all;
entity PE is
    generic(
        data_size       : integer := 8
    );
    port(
        i_data          : in     vl_logic_vector;
        o_data          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_size : constant is 1;
end PE;
