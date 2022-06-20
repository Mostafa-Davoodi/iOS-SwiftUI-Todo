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
					.foregroundColor(task.completed ? Color.green : Color.gray)
			}
			Text(task.title)
				.foregroundColor(.black)
			Spacer()
		}
		.onAppear(perform: {
			isComplete = task.completed
		})
		.padding(.init(top: 16, leading: 20, bottom: 16, trailing: 20))
	}
	
	private func toggleCompletion() {
		isComplete.toggle()
		viewModel.markComplete(id: task.id, completed: isComplete)
	}
}

