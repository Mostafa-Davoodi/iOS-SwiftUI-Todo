//
//  TaskView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct TaskView: View {
	@EnvironmentObject private var viewModel: TaskViewModel
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State private var taskTitle: String = ""
	@State private var dueDate: Date = Date()
	let task: Task
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 24) {
			
			VStack(alignment: .leading, spacing: 4) {
				
				Text("Title")
					.foregroundColor(.gray)
				
				TextField("Update title here", text: $taskTitle)
				
			}
			
			DatePicker("Select due date", selection: $dueDate)
			
			Button {
				self.deleteHandler()
			} label: {
				HStack {
					Image(systemName: "trash.fill")
					Text("Delete")
				}.foregroundColor(.red)
			}
			
			Spacer()
			
		}
		.navigationBarTitle("Edit todo")
		.padding(24)
		.onAppear {
			taskTitle = task.title
			dueDate = task.dueDate ?? Date()
		}
		.onDisappear(perform: updateTask)
		
		
	}
	
	private func updateTask() {
		viewModel.update(id: task.id, newTitle: taskTitle, dueDate: dueDate)
	}
	
	private func deleteHandler() {
		viewModel.remove(id: task.id)
		presentationMode.wrappedValue.dismiss()
	}
}
