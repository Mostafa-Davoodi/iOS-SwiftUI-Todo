//
//  ContentView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			VStack {
				AddTaskView()
				TaskListView()
			}
			.navigationTitle("Todo")
		}
			
		
	}
}

struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
				ContentView()
		}
}