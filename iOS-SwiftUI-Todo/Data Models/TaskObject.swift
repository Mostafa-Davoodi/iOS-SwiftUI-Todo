//
//  TaskObject.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import Foundation
import RealmSwift

class TaskObject: Object {
	@Persisted(primaryKey: true) var id: ObjectId
	@Persisted var title: String
	@Persisted var desc: String
	@Persisted var completed: Bool = false
	@Persisted var completedAt: Date? = nil
	@Persisted var dueDate: Date? = nil
	@Persisted var taskColor: String? = nil
}
