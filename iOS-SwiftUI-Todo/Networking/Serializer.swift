//
//  Serializer.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/2/22.
//

import UIKit

class Serializer {
	
	static func serialize(user: NewUser) -> String? {
		
//		#1
//		let jsonData = try! JSONEncoder().encode(user)
//		let jsonString = String(data: jsonData, encoding: .utf8)
//		return jsonString
		
		let encoder = JSONEncoder()
		encoder.outputFormatting = .withoutEscapingSlashes
		do {
			let jsonData = try encoder.encode(user)
			let jsonString = String(data: jsonData, encoding: .utf8)
			return jsonString
		} catch {
			// respond to error
			return nil
		}
		
	}
	
	static func deserialize(jsonString: String) -> NewUser? {
		if let jsonData = jsonString.data(using: .utf8) {
//			#1
//			let user = try! JSONDecoder().decode(NewUser.self, from: jsonData)
//			return user
			
//			#2
			let decoder = JSONDecoder()
			do {
				let user = try decoder.decode(NewUser.self, from: jsonData)
				return user
			} catch {
				print(error.localizedDescription)
				return nil
			}
			
		} else {
			// respond to erro
			return nil
		}
	}
	
	static func deserializeArray(jsonString: String) -> [NewUser] {
		if let jsonData = jsonString.data(using: .utf8) {
			let decoder = JSONDecoder()
			do {
				let users = try decoder.decode([NewUser].self, from: jsonData)
				return users
			} catch {
				return []
			}
		}
		return []
	}
	
	static func oldWayDeserialization(data: Data) {
		let json = try? JSONSerialization.jsonObject(with: data, options: .json5Allowed)
		if let recipe = json as? [String: Any] {
			if let yield = recipe["yield"] as? Int {
				// anything with yield
				print(yield)
			}
		}
	}
	
	static func rawUserJson() -> String {
		return """
{
"first_name": "Mostafa",
"last_name": "Davoodi",
"country": "Canada"

}
"""
	}
	
	static func rawUserArrayJson() -> String {
		return """
[
{
	"first_name": "John",
	"last_name": "Doe",
	"country": "Canada"
},
{
 "first_name": "Mostafa",
 "last_name": "Davoodi",
 "country": "Canada"
}
]
"""
	}
	
	static func rawResponseType() -> String {
		return """
{
	users: [
{
	"first_name": "John",
	"last_name": "Doe",
	"country": "Canada"
},
{
 "first_name": "Mostafa",
 "last_name": "Davoodi",
 "country": "Canada"
}
]
}
"""
	}
	
}


//struct NewUser: Codable {
//	var first_name: String
//	var last_name: String
//	var country: String
//}


struct NewUser: Codable {
	var firstName: String
	var lastName: String
	var country: String
	
	enum CodingKeys: String, CodingKey {
		case firstName = "first_name"
		case lastName = "last_name"
		case country
	}
}


struct ResponseType: Codable {
	var users: [NewUser]
}
