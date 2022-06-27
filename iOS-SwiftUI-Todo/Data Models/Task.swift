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
	var dueDate: Date? = nil
	
	init(
		id: String,
		title: String,
		completed: Bool = false,
		completedAt: Date = Date(),
		dueDate: Date? = nil
	) {
		self.id = id
		self.title = title
		self.completed = completed
		self.completedAt = completedAt
		self.dueDate = dueDate
	}
	
	init(taskObject: TaskObject) {
		self.id = taskObject.id.stringValue
		self.title = taskObject.title
		self.completed = taskObject.completed
		self.completedAt = taskObject.completedAt
		self.dueDate = taskObject.dueDate
	}
	
	var formattedDate: String {
		if let date = dueDate {
			let format = "MMM d, y"
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = format
			return "Due at \(dateFormatter.string(from: date))"
		}
		return ""
	}
	
}

