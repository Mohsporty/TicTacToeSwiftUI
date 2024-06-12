import Foundation


class GameState : ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    
    init()
    {
        resetBoard()
    }
    func  placeTile(_ row: Int, column: Int) {
        if (board[row][column].tile != Tile.Empty){
            return
        }
        
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
    }
        func resetBoard() {
            
            var newBoard =  [[Cell]]()
            
            for _ in 0...2
            {
                var row = [Cell]()
                for _ in 0...2
                {
                    row.append(Cell(tile: Tile.Empty))
                }
                newBoard.append(row)
            }
            board = newBoard
        }
    }

