//
//  TaskRowView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct TaskRowView: View {
	@EnvironmentObject private var viewModel: TaskViewModel
	@State private var isComplete: Bool = false
	let task: Task
		
	var body: some View {
			
		HStack(spacing: 8) {
			
			Button {
				self.toggleCompletion()
			} label: {
				Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
					.resizable()
					.frame(width: 20, height: 20)
					.foregroundColor(task.completed ? Color.blue : Color.gray)
			}
			
			Text(task.title)
				.foregroundColor(.black)
			
			Spacer()
			
			Text(task.formattedDate)
				.foregroundColor(.black)
			
		}
		.onAppear {
			isComplete = task.completed
		}
		
		
	}
	
	private func toggleCompletion() {
		isComplete.toggle()
		viewModel.markComplete(id: task.id, completed: isComplete)
	}
	
}

