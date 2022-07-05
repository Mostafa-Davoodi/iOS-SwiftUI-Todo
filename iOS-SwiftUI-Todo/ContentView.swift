//
//  ContentView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 6/19/22.
//

import SwiftUI

struct ContentView: View {
	
	init() {
		UITabBar.appearance().backgroundColor = .lightGray
	}
		
	var body: some View {
		
		TabView {
			
			NavigationView {
				TaskView()
					.navigationBarTitle("Todo")
			}
			.tabItem {
				Label("Todo", systemImage: "list.dash")
			}
			
			
			NavigationView {
				SettingView()
					.navigationBarTitle("Setting")
			}
			.tabItem {
				Label("Setting", systemImage: "gear")
			}
			
			
		}
				
		
	}
}

struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
				ContentView()
		}
}
