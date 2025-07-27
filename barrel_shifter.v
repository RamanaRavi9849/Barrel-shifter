`timescale 1ns / 1ps



module barrel_shifter(

    input  [7:0] data_in,
    input  [2:0] shift_amt,      
    input  [2:0] mode_sel,       
    output reg [7:0] data_out
);
    always @(*) begin
        case (mode_sel)
            3'b000: data_out = data_in << shift_amt;                                 // Logical Shift Left
            3'b001: data_out = data_in >> shift_amt;                                 // Logical Shift Right
            3'b010: data_out = $signed(data_in) >>> shift_amt;                       // Arithmetic Shift Right
            3'b011: data_out = (data_in >> shift_amt) | (data_in << (8 - shift_amt)); // Rotate Right
            3'b100: data_out = (data_in << shift_amt) | (data_in >> (8 - shift_amt)); // Rotate Left
            default: data_out = data_in;
        endcase
    end

endmodule
