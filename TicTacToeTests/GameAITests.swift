//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Nathanael Youngren on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    var board: GameBoard!
    
    override func setUp() {
        super.setUp()
        board = GameBoard()
    }
    
    
    func testWinCheckingVertical1() throws {
        
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() throws {
        
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() throws {
        
        try board.place(mark: .o, on: (0, 0))
        try board.place(mark: .x, on: (1, 2))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (1, 1))
        try board.place(mark: .o, on: (2, 0))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
}
