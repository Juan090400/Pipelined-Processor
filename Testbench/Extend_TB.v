`timescale 1 ns / 1 ps

module Extend_tb;
    reg [31:7] InstrD;     // Definir InstrD como entrada de 25 bits (como en el módulo)
    reg [2:0] ImmSrcD;     // Registro para controlar ImmSrcD
    wire [31:0] ImmExtD;   // ImmExtD es la salida del módulo

    Extend u1 (
        .InstrD(InstrD),
        .ImmSrcD(ImmSrcD),
        .ImmExtD(ImmExtD)
    );

    // Simulación
    initial begin
        // Inicialización
        InstrD = 25'b0010111110111100101001001;
        ImmSrcD = 3'd0;

        // Ciclo de pruebas
        #20; ImmSrcD = 3'd0;  // Caso 0
        #20; ImmSrcD = 3'd1;  // Caso 1
        #20; ImmSrcD = 3'd2;  // Caso 2
        #20; ImmSrcD = 3'd3;  // Caso 3
        #20; ImmSrcD = 3'd4;  // Caso 4
        #20; ImmSrcD = 3'd5;  // Caso default

        // Finalización
        #100;
        $finish;
    end

    // Generar archivo de salida para la simulación
    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, Extend_tb);
    end
endmodule
