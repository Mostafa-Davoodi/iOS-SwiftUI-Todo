//
//  TodoModel.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/1/22.
//

import Foundation

struct TodoModel: Codable {
	var id: String?
	var name: String?
	var completed: Bool?
	var version: Int?
	var note: String?
	
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case name
		case completed
		case version = "__v"
		case note
	}
}

struct NoteBody: Codable {
	var name: String
}
