//
//  SwiftStoryboardUITestExampleUITests.swift
//  SwiftStoryboardUITestExampleUITests
//
//  Created by Erge Gevher Akova on 24.08.2022.
//

import XCTest

class SwiftStoryboardUITestExampleUITests: XCTestCase {
    
    func testToDoItem() throws{
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["SwiftStoryboardUITestExample.View"].buttons["Add"]
        let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
        let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        XCTAssertTrue(addedCell.exists)
    }
    
    func testDeleteItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["SwiftStoryboardUITestExample.View"].buttons["Add"]
        let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
        let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
    }
}
