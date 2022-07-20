//
//  TaskViewModel.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import Foundation
import Combine
import RealmSwift

final class TaskViewModel: ObservableObject {
	
	@Published var tasks: [Task] = []
	var realm: Realm!
	
	private var token: NotificationToken?
	
	init() {
		self.realm = try? Realm()
		setupObserver()
	}
	
	deinit {
		token?.invalidate()
	}
	
	
	private func setupObserver() {
		
		let results = self.realm.objects(TaskObject.self)
		
		token = results.observe({ [weak self] changes in
			self?.tasks = results.map(Task.init).sorted(by: { a, b in
				a.completedAt ?? Date() > b.completedAt ?? Date()
			})
		})
		
	}
	
	func addTask(title: String) -> String? {
		
		
		do {
			let objectId = ObjectId(timestamp: Date(), machineId: 1, processId: 1)
			let taskObject = TaskObject(value: [
				"id": objectId,
				"title": title,
				"completed": false
			])
			
			try self.realm.write {
				realm.add(taskObject)
			}
			
			return objectId.stringValue
			
		} catch let error {
			print(error.localizedDescription)
			return nil
		}
	}
	
	
	func markComplete(id: String, completed: Bool) {
		do {
			let objectId = try ObjectId(string: id)
			let task = self.realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
			try realm.write {
				task?.completed = completed
				task?.completedAt = Date()
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func remove(id: String) {
		do {
			let objectId = try ObjectId(string: id)
			if let task = self.realm.object(ofType: TaskObject.self, forPrimaryKey: objectId) {
				try realm.write {
					realm.delete(task)
				}
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func update(
		id: String,
		title: String,
		description: String,
		dueDate: Date?,
		color: TaskColor?) {
		do {
			let objectId = try ObjectId(string: id)
			let task = self.realm.object(ofType: TaskObject.self, forPrimaryKey: objectId)
			try realm.write {
				task?.title = title
				task?.desc = description
				task?.dueDate = dueDate
				task?.taskColor = color?.rawValue
			}
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
}

