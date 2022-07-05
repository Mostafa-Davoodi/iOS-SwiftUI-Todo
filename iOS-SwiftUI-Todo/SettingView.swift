//
//  SettingView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/4/22.
//

import SwiftUI

struct SettingView: View {
	private let items = ["FAQ", "Language", "Version"]
	var body: some View {
		List {
			ForEach(items, id: \.self) { item in
				NavigationLink {
					Text(item)
				} label: {
					Text(item)
				}

			}
		}
	}
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
