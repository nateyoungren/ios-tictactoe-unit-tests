//
//  Game.swift
//  TicTacToe
//
//  Created by Nathanael Youngren on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart() {
        self.board = GameBoard()
        activePlayer = GameBoard.Mark.x
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        try self.board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            gameIsOver = true
            winningPlayer = player
        } else if board.isFull {
            gameIsOver = true
            winningPlayer = nil
        } else {
            gameIsOver = false
            self.activePlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
        }
    }
    
    private(set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
}
