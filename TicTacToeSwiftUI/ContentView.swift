//
//  ContentView.swift
//  TicTacToeSwiftUI
//
//  Created by Mohammad  on 06/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var  gameState = GameState()
    
    
    
    var body: some View {
        let boarderSize = CGFloat(5)
        VStack(spacing: boarderSize) {
            ForEach (0...2, id: \.self) {
                row in
                HStack(spacing: boarderSize)
                {
                    ForEach(0...2, id: \.self)
                    {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture{
                                gameState.placeTile(row, column: column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
    }
}

#Preview {
    ContentView()
}
