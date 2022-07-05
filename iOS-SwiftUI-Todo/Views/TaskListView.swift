//
//  TaskListView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct TaskListView: View {
	
	@EnvironmentObject private var viewModel: TaskViewModel
	
	var body: some View {
			
		ForEach(viewModel.tasks, id: \.id) { task in
			
			NavigationLink {
				TaskDetailView(task: task)
			} label: {
				TaskRowView(task: task)
			}
			
		}
		
	}
	
}

struct TaskListView_Previews: PreviewProvider {
		static var previews: some View {
				TaskListView()
		}
}
