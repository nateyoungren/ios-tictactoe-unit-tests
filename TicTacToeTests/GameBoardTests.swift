//
//  GameBoardTests.swift
//  GameBoardTests
//
//  Created by Nathanael Youngren on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    var board: GameBoard!
    
    // runs before every test
    override func setUp() {
        super.setUp()
        
        board = GameBoard()
    }
    
    func testNewGameBoardIsEmpty() {
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x,y)])
            }
        }
    }
    
    func testPlacingASingleMark() throws {
        
        try board.place(mark: .x, on: (0, 0))
        
        XCTAssertEqual(.x, board[(0, 0)])
        
        // XCTAssertEqual(expected, actual)
    }
    
    // DRY: Don't Repeat Yourself
    
    func testPlacingADuplicateMarkThrowsAnError() {
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        
        XCTAssertThrowsError(try board.place(mark: .x, on: (1, 1))) { (error) in
            XCTAssertEqual(GameBoardError.invalidSquare, error as? GameBoardError)
        }
    }
    
    func testBoardIsFullAfterFillingAllSpots() throws {
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)
                try board.place(mark: .x, on: (x, y))
            }
        }
        XCTAssertTrue(board.isFull)
    }
}
