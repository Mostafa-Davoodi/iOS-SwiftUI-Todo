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
	@State private var taskDescription: String = ""
	@State private var taskColor: TaskColor?
	@State private var dueDate: Date = Date()
	let task: Task
	
	var body: some View {
		
		VStack(alignment: .center, spacing: 32) {
			
			VStack(alignment: .leading, spacing: 8) {
				
				Text("Title")
					.foregroundColor(.gray)
				
				TextField("Update title here", text: $taskTitle)
				
			}
			
			VStack(alignment: .leading, spacing: 8) {
				
				Text("Description")
					.foregroundColor(.gray)
				
				TextField("Update description here", text: $taskDescription)
				
			}
			
			DatePicker("Select due date", selection: $dueDate)
			
			HStack(spacing: 16) {
				ForEach(TaskColor.allCases) { color in
					ColorView(color: color.color, selected: color == taskColor)
						.onTapGesture {
							withAnimation {
								taskColor = color
							}
						}
				}
			}
			
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
			taskDescription = task.description
			dueDate = task.dueDate ?? Date()
			taskColor = task.color
		}
		
	}
	
	private func updateTask() {
		viewModel.update(
			id: task.id,
			title: taskTitle,
			description: taskDescription,
			dueDate: dueDate,
			color: taskColor
		)
		presentationMode.wrappedValue.dismiss()
	}
	
	private func deleteHandler() {
		viewModel.remove(id: task.id)
		presentationMode.wrappedValue.dismiss()
	}
}
