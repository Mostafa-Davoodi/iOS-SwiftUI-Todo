//
//  Task.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
	var id: String
	var title: String
	var description: String
	var completed: Bool = false
	var completedAt: Date? = nil
	var dueDate: Date? = nil
	var color: TaskColor? = nil
	
	init(
		id: String,
		title: String,
		description: String,
		completed: Bool = false,
		completedAt: Date? = nil,
		dueDate: Date? = nil,
		color: TaskColor? = nil
	) {
		self.id = id
		self.title = title
		self.description = description
		self.completed = completed
		self.completedAt = completedAt
		self.dueDate = dueDate
		self.color = color
	}
	
	init(taskObject: TaskObject) {
		self.id = taskObject.id.stringValue
		self.title = taskObject.title
		self.description = taskObject.desc
		self.completed = taskObject.completed
		self.completedAt = taskObject.completedAt
		self.dueDate = taskObject.dueDate
		self.color = TaskColor(rawValue: taskObject.taskColor ?? "")
	}
	
	var formattedDate: String {
		if let date = dueDate {
			let format = "MMM d, y"
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = format
			return "\(dateFormatter.string(from: date))"
		}
		return ""
	}
	
}

enum TaskColor: String, CaseIterable, Identifiable, Decodable {	
	public var id: String { rawValue }

	case red
	case blue
	case green
	case gray
	
	var color: Color {
		switch self {
		case .red: return .red
		case .blue: return .blue
		case .green: return .green
		case .gray: return .gray
		}
	}
}
