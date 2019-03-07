//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Nathanael Youngren on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testRestart() {
        var game = Game.init(board: GameBoard(), activePlayer: .o, gameIsOver: true, winningPlayer: .o)
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
    }
    
    func testActivePlayerHasWon() {
        /*
        x x x
        o o -
        - - -
        */
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        try! game.makeMark(at: (0, 0))
        game.activePlayer = .o
        try! game.makeMark(at: (1,0))
        game.activePlayer = .x
        try! game.makeMark(at: (0,1))
        game.activePlayer = .o
        try! game.makeMark(at: (1,1))
        game.activePlayer = .x
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
    }
    
    func testBoardIsFull() {
        /*
        x o x
        o x x
        o x o
        */
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        try! game.makeMark(at: (0, 0))
        game.activePlayer = .o
        try! game.makeMark(at: (0, 1))
        game.activePlayer = .x
        try! game.makeMark(at: (0, 2))
        game.activePlayer = .o
        try! game.makeMark(at: (1, 0))
        game.activePlayer = .x
        try! game.makeMark(at: (1, 1))
        game.activePlayer = .x
        try! game.makeMark(at: (1, 2))
        game.activePlayer = .o
        try! game.makeMark(at: (2, 0))
        game.activePlayer = .x
        try! game.makeMark(at: (2, 1))
        game.activePlayer = .o
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == nil)
    }
}
