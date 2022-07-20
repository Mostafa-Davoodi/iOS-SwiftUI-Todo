//
//  ColorView.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/19/22.
//

import SwiftUI

struct ColorView: View {
	private let color: Color
	private let selected: Bool
	private let size: CGFloat
	
	init(
		color: Color,
		selected: Bool = false,
		size: CGFloat = 32
	) {
		self.color = color
		self.selected = selected
		self.size = size
	}
	
	var body: some View {
		
		ZStack(alignment: .center) {
			Circle()
				.foregroundColor(selected ? Color.primary : color)
			
			if selected {
				Circle()
					.foregroundColor(color)
					.padding([.all], 4.0)
			}
		}
		.frame(width: size, height: size)
		
	}
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
			ColorView(color: .red, selected: false)
    }
}
