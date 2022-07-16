//
//  iOS_SwiftUI_TodoTests.swift
//  iOS-SwiftUI-TodoTests
//
//  Created by Mostafa Davoodi on 7/15/22.
//

import XCTest
import RealmSwift
@testable import iOS_SwiftUI_Todo

class iOS_SwiftUI_TodoTests: XCTestCase {
	
	private var sut: TaskViewModel!

	override func setUpWithError() throws {
		try super.setUpWithError()
		Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
		sut = TaskViewModel()
	}

	override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}
	
	func testTaskViewModel_WhenAddNewTask_taskShouldBeAvailableInViewModel() throws {
		let title = "test add task functionality"
		let taskId = sut.addTask(title: title)
		
		let delayExpectation = expectation(description: "add task delay expectation")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			XCTAssertTrue(self.sut.tasks.contains(where: { task in
				task.id == taskId
			}))
			delayExpectation.fulfill()
		}
		waitForExpectations(timeout: 2)
	}

	func testTaskViewModel_WhenUpdateTask_taskShouldBeUpdatedInViewModel() throws {
		let title = "test update task functionality"
		let taskId = sut.addTask(title: title)
		
		let updatedTask = "test update task functionality (UPDATED!!!)"
		
		sut.update(id: taskId ?? "", newTitle: updatedTask, dueDate: Date())
		
		let delayExpectation = expectation(description: "update task delay expectation")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			XCTAssertTrue(self.sut.tasks.contains(where: { task in (task.title == updatedTask) && (task.id == taskId) }))
			delayExpectation.fulfill()
		}
		waitForExpectations(timeout: 2)
	}

	func testTaskViewModel_WhenRemoveTask_taskShouldNotBeAvailableInViewModel() throws {
		let title = "test remove task functionality"
		let taskId = sut.addTask(title: title)
		
		sut.remove(id: taskId ?? "")
		
		let delayExpectation = expectation(description: "remove task delay expectation")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			XCTAssertFalse(self.sut.tasks.contains(where: { task in task.id == taskId }))
			delayExpectation.fulfill()
		}
		waitForExpectations(timeout: 2)
	}
	
	func testTaskViewModel_WhenMarkCompleteTask_taskShouldBeUpdatedInViewModel() throws {
		let title = "test mark complete task functionality"
		let taskId = sut.addTask(title: title)
		
		sut.markComplete(id: taskId ?? "", completed: true)
		
		let delayExpectation = expectation(description: "mark complete task delay expectation")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			XCTAssertTrue(self.sut.tasks.contains(where: { task in (task.id == taskId) && (task.completed) }))
			delayExpectation.fulfill()
		}
		waitForExpectations(timeout: 2)
	}

}
