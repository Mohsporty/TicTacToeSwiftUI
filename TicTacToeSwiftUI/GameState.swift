import Foundation


class GameState : ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var noughtsScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    init()
    {
        resetBoard()
    }
    func  placeTile(_ row: Int, column: Int) {
        if (board[row][column].tile != Tile.Empty){
            return
        }
   
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
      
        
        if(checkForVictory())
        {
            if(turn == Tile.Cross) {
                crossesScore += 1
                
            }
            else {
                noughtsScore += 1
            }
            let winner = turn == Tile.Cross ? "Crosses" : "Noughts"
            alertMessage = winner + "Win!"
            showAlert = true
        }
        else {
      
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
        
        func checkForVictory() -> Bool {
            // vertical victoriys
                
                if isTurnTitle(0,  0) && isTurnTitle(1, 0) && isTurnTitle(2, 0){
                    return true
                }
                if isTurnTitle(0,  1) && isTurnTitle(1, 1) && isTurnTitle(2, 1){
                    return true
                }
                if isTurnTitle(0,  2) && isTurnTitle(1, 2) && isTurnTitle(2, 2){
                    return true
                }  // Horizantel  victoriys
            
            if isTurnTitle(0,  0) && isTurnTitle(0, 1) && isTurnTitle(0, 2){
                return true
            }
            if isTurnTitle(0,  0) && isTurnTitle(0, 1) && isTurnTitle(1, 2){
                return true
            }
            if isTurnTitle(0,  2) && isTurnTitle(1, 2) && isTurnTitle(2, 2){
                return true
            }
            // dignetcch   victoriys
        
        if isTurnTitle(0,  0) && isTurnTitle(1, 1) && isTurnTitle(2, 2){
            return true
        }
        if isTurnTitle(0,  2) && isTurnTitle(1, 1) && isTurnTitle(2, 0){
            return true
        }
            return false
        }
    }
    
    func isTurnTitle(_ row: Int,_ column: Int) -> Bool
    {
        return board [row][column].tile == turn
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

