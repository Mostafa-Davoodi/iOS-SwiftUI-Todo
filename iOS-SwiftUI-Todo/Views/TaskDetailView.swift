//
//  TaskView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct TaskDetailView: View {
	@EnvironmentObject private var viewModel: TaskViewModel
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State private var taskTitle: String = ""
	@State private var dueDate: Date = Date()
	let task: Task
	
	var body: some View {
		
		VStack(alignment: .center, spacing: 24) {
			
			VStack(alignment: .leading, spacing: 4) {
				
				Text("Title")
					.foregroundColor(.gray)
				
				TextField("Update title here", text: $taskTitle)
				
			}
			
			DatePicker("Select due date", selection: $dueDate)
			
			Spacer()
			
			Button(action: {
				deleteHandler()
			}, label: {
				Text("Delete")
					.padding()
					.foregroundColor(.white)
					.background(Color.red)
					.cornerRadius(8)
			})
			.padding()
			
		}
		.toolbar(content: {
			Button("Save") {
				updateTask()
			}
		})
		.navigationBarTitle("Edit todo")
		.padding(24)
		.onAppear {
			taskTitle = task.title
			dueDate = task.dueDate ?? Date()
		}
		
	}
	
	private func updateTask() {
		viewModel.update(id: task.id, newTitle: taskTitle, dueDate: dueDate)
		presentationMode.wrappedValue.dismiss()
	}
	
	private func deleteHandler() {
		viewModel.remove(id: task.id)
		presentationMode.wrappedValue.dismiss()
	}
}
