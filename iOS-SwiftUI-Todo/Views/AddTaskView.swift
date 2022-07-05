//
//  AddTaskView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct AddTaskView: View {
	
	@State private var taskTitle = ""
	@State private var showEmptyTodoAlert: Bool = false
	@EnvironmentObject private var viewModel: TaskViewModel
	
	var body: some View {
		
		HStack(spacing: 12) {
			
			TextField("Enter New Task...", text: $taskTitle)
			
			Button {
				self.handleSubmit()
			} label: {
				Image(systemName: "plus")
			}
			
		}
		.alert("Empty title!", isPresented: $showEmptyTodoAlert) {
			Button("Close"){ }
		}
			
	}
	
	private func handleSubmit() {
		if !taskTitle.isEmpty {
			viewModel.addTask(title: taskTitle)
			taskTitle = ""
		} else {
			showEmptyTodoAlert.toggle()
		}
	}
	
}

struct AddTaskView_Previews: PreviewProvider {
		static var previews: some View {
				AddTaskView()
		}
}
