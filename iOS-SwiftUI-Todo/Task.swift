//
//  Task.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import Foundation

struct Task: Identifiable {
	var id: String
	var title: String
	var completed: Bool = false
	var completedAt: Date = Date()
	
	init(taskObject: TaskObject) {
		self.id = taskObject.id.stringValue
		self.title = taskObject.title
		self.completed = taskObject.completed
		self.completedAt = taskObject.completedAt
	}
}
