//
//  TaskView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/4/22.
//

import SwiftUI

struct TaskView: View {
	var body: some View {
		List {
			Section {
				AddTaskView()
			}
			
			Section {
				TaskListView()
			}
		}
	}
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
