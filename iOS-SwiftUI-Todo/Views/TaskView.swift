//
//  TaskView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/4/22.
//

import SwiftUI

struct TaskView: View {
	@EnvironmentObject private var viewModel: TaskViewModel
	
	var body: some View {
		List {
			Section {
				AddTaskView()
			}
			
			Section {
				ForEach(viewModel.tasks, id: \.id) { task in
					
					NavigationLink {
						TaskDetailView(task: task)
					} label: {
						TaskRowView(task: task)
					}
					
				}
				.onDelete(perform: delete(at:))
			}
		}
	}
	
	func delete(at offsets: IndexSet) {
		let id = offsets.map { self.viewModel.tasks[$0].id }.first ?? ""
		viewModel.remove(id: id)
	}
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
