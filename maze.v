`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:55 12/05/2021 
// Design Name: 
// Module Name:    maze 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module maze(
input 		          clk,
input [maze_width - 1:0]  starting_col, starting_row, 	// indicii punctului de start
input  			  maze_in, 			// ofera informa?ii despre punctul de coordonate [row, col]
output reg[maze_width - 1:0] row, col,	 		// selecteaza un rând si o coloana din labirint
output reg			  maze_oe,			// output enable (activeaza citirea din labirint la rândul ?i coloana date) - semnal sincron	
output reg			  maze_we, 			// write enable (activeaza scrierea în labirint la rândul ?i coloana date) - semnal sincron
output reg			  done);		 	// ie?irea din labirint a fost gasita; semnalul ramane activ 

parameter maze_width = 6;

parameter starting_pos = 0;
parameter N = 1;
parameter S = 2; 
parameter E = 3;
parameter V = 4;
parameter verify_pos = 5;
parameter empty = 6;
parameter wall = 7;

reg[2:0] state, next_state, prev_state;
reg goBack;

always@(posedge clk)begin
	if(done == 0)
		state <= next_state;
end

always@(*)begin
maze_oe = 0;
maze_we = 0;
done = 0;
next_state = starting_pos;

case(state)
starting_pos:begin
	row = starting_row;
	col = starting_col;
	goBack = 0;
	next_state = verify_pos;
	prev_state = E;
	maze_oe = 1;
end

N:begin
	row = row-1;
	if(goBack == 0)begin
		prev_state = N;
		next_state = verify_pos;
		maze_oe = 1;
	end else
		next_state = empty;
end

S:begin
	row = row+1;
	if(goBack == 0)begin
		prev_state = S;
		next_state = verify_pos;
		maze_oe = 1;
	end else 
		next_state = empty;
end

E:begin
	maze_oe = 1;
	col = col+1;
	if(goBack == 0)begin
		prev_state = E;
		next_state = verify_pos;
		maze_oe = 1;
	end else
		next_state = empty;
end

V:begin
	col = col-1;
	if(goBack == 0)begin
		prev_state = V;
		next_state = verify_pos;
		maze_oe = 1;
	end else 
		next_state = empty;
end

verify_pos:begin
	if(maze_in == 0)begin
		if(row == 63 || row == 0 || col == 63 || col == 0)
			done = 1;							
		next_state = empty;
		maze_we = 1;
	end else 
		next_state = wall;
end

empty:begin
	if(prev_state == N)begin
		if(goBack == 0)
			next_state = E;
		else begin
			next_state = V;
			goBack = 0;
		end	
	end else if(prev_state == S)begin
		if(goBack == 0)
			next_state = V;
		else begin
			next_state = E;
			goBack = 0;
		end
	end else if(prev_state == E)begin
		if(goBack == 0)
			next_state = S;
		else begin
			next_state = N;
			goBack = 0;
		end
	end else if(prev_state == V)begin
		if(goBack == 0)
			next_state = N;
		else begin
			next_state = S;
			goBack = 0;
		end		
	end
end

wall:begin
	if(prev_state == N)begin
		next_state = S;
	end else if(prev_state == S)begin
		next_state = N;
	end else if(prev_state == E)begin
		next_state = V;
	end else begin
		next_state = E;
	end
	goBack = 1;
end

endcase

end

endmodule
