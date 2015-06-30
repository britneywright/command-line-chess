require 'chess/cli'
require 'stringio'

RSpec.describe 'Chess::CLI' do
  it "plays a fast game of chess" do
    stdout = StringIO.new
    stdin = StringIO.new("f2\nf3\ne7\ne5\ng2\ng4\nd8\nh4\THIS IS NOT READ!")
    existstatus = Chess::CLI.new(stdin,stdout).call
    expect(existstatus).to eq 0
    expect(stdin.read).to eq 'THIS IS NOT READ!'
    expect(stdout.string).to eq \
    "8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜\n" +
    "7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟\n" +
    "6                        \n" +
    "5                        \n" +
    "4                        \n" +
    "3                        \n" +
    "2  ♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙\n" +
    "1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖\n" +
    "   a  b  c  d  e  f  g  h\n" +
    "white's turn.\n" +
    "white, your move? \n" +
    "moves for white pawn f2: f3, f4\n" +
    "white, move f2 where? f3\n" +
    "\n" +
    "Ok, white's pawn f2 to f3.\n" +
    "\n" +
    "8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜\n" +
    "7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟\n" +
    "6                        \n" +
    "5                        \n" +
    "4                        \n" +
    "3                 ♙      \n" +
    "2  ♙  ♙  ♙  ♙  ♙     ♙  ♙\n" +
    "1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖\n" +
    "   a  b  c  d  e  f  g  h\n" +
    "black's turn.\n" +
    "black, your move? \n" +
    "moves for black pawn e7: e5, e6\n" +
    "black, move e7 where? e5\n" +
    "\n" +
    "Ok, black's pawn e7 to e5.\n" +
    "\n" +
    "8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜\n" +
    "7  ♟  ♟  ♟  ♟     ♟  ♟  ♟\n" +
    "6                        \n" +
    "5              ♟         \n" +
    "4                        \n" +
    "3                 ♙      \n" +
    "2  ♙  ♙  ♙  ♙  ♙     ♙  ♙\n" +
    "1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖\n" +
    "   a  b  c  d  e  f  g  h\n" +
    "white's turn.\n" +
    "white, your move? \n" +
    "moves for white pawn g2: g3, g4\n" +
    "white, move g2 where? g4\n" +
    "\n" +
    "Ok, white's pawn g2 to g4.\n" +
    "\n" +
    "8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜\n" +
    "7  ♟  ♟  ♟  ♟     ♟  ♟  ♟\n" +
    "6                        \n" +
    "5              ♟         \n" +
    "4                    ♙   \n" +
    "3                 ♙      \n" +
    "2  ♙  ♙  ♙  ♙  ♙        ♙\n" +
    "1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖\n" +
    "   a  b  c  d  e  f  g  h\n" +
    "black's turn.\n" +
    "black, your move? \n" +
    "moves for black queen d8: e7, f6, g5, h4\n" +
    "black, move d8 where? h4\n" +
    "\n" +
    "Ok, black's queen d8 to h4.\n" +
    "Checkmate. Black wins.\n"
    "\n" +
    "8  ♜  ♞  ♝     ♚  ♝  ♞  ♜\n" +
    "7  ♟  ♟  ♟  ♟     ♟  ♟  ♟\n" +
    "6                        \n" +
    "5              ♟         \n" +
    "4                    ♙  ♛\n" +
    "3                 ♙      \n" +
    "2  ♙  ♙  ♙  ♙  ♙        ♙\n" +
    "1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖\n" +
    "   a  b  c  d  e  f  g  h\n" 
  end
end
