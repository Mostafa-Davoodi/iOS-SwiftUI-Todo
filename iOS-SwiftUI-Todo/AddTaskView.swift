//
//  AddTaskView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct AddTaskView: View {
	
	@State private var taskTitle: String = ""
	@EnvironmentObject private var viewModel: TaskViewModel
	
	var body: some View {
		HStack(spacing: 12) {
			TextField("Enter New Task..", text: $taskTitle)
			Button {
				self.handleSubmit()
			} label: {
				Image(systemName: "plus")
			}

		}
		.padding()
		
	}
	
	private func handleSubmit() {
		viewModel.addTask(title: taskTitle)
		taskTitle = ""
	}
}

struct AddTaskView_Previews: PreviewProvider {
		static var previews: some View {
				AddTaskView()
		}
}
