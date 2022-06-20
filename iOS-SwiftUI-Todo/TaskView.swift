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
	
	let task: Task
	
	var body: some View {
			
		VStack(alignment: .leading, spacing: 24) {
			
			VStack(alignment: .leading, spacing: 4) {
				Text("Title")
					.foregroundColor(.gray)
				
				TextField("Enter title..", text: $taskTitle)
					.font(.largeTitle)
				
				Divider()
			}
			
			Button {
				deleteAction()
			} label: {
				HStack {
					Image(systemName: "trash.fill")
					Text("Delete")
				}
				.foregroundColor(.red)
			}
			
			Spacer()

		}
		.navigationBarTitle("Edit Todo")
		.navigationBarTitleDisplayMode(.inline)
		.padding(24)
		.onAppear(perform: {
			taskTitle = task.title
		})
		.onDisappear(perform: updateTask)
	}
	
	private func updateTask() {
		viewModel.updateTitle(id: task.id, newTitle: taskTitle)
	}
	
	private func deleteAction() {
		viewModel.remove(id: task.id)
		presentationMode.wrappedValue.dismiss()
	}
}
