//
//  NetworkingLayer.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/1/22.
//

import Foundation

class NetworkingLayer {
	let baseUrl = "http://localhost:3000/todos"
	
	
	func getAllTodos() {
		let session = URLSession.shared
		let url = URL(string: baseUrl)!
		
		let task = session.dataTask(with: url) { data, response, error in
			if let error = error {
				print(error.localizedDescription)
			} else {
				if let data = data,
						let response = response as? HTTPURLResponse,
					 (200...299).contains(response.statusCode) {
					let unwrapData = self.deserialize(data: data)
					print("data is: ")
					print(unwrapData)
					
					
				}
			}
		}
		task.resume()
	}
	
	func createNewItem(body: NoteBody) {
		let session = URLSession.shared
		let url = URL(string: baseUrl)!
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		
		if let json = try? JSONEncoder().encode(body) {
			request.httpBody = json
			let task = session.dataTask(with: url) { data, response, error in
				if let error = error {
					print(error.localizedDescription)
				} else {
					if let data = data,
							let response = response as? HTTPURLResponse,
						 (200...299).contains(response.statusCode) {
						let unwrapData = self.deserializeSingle(data: data)
						print("data is: ")
						print(unwrapData)
						
						
					}
				}
			}
			task.resume()
		}
		
	}
	
	func getSingleItem(id: String) {
		
	}
	
	func updateSingleItem(id: String) {
		
	}
	
	func deleteSingleItem(id: String) {
		
	}
	
	
	func deserialize(data: Data) -> [TodoModel] {
		let decoder = JSONDecoder()
		do {
			return try decoder.decode([TodoModel].self, from: data)
		} catch {
			print(error.localizedDescription)
			return []
		}
	}
	
	func deserializeSingle(data: Data) -> TodoModel? {
		let decoder = JSONDecoder()
		do {
			return try decoder.decode(TodoModel.self, from: data)
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
	
}
