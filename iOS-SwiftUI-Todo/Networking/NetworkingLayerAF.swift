//
//  NetworkingLayerAF.swift
//  iOS-SwiftUI-Todo
//
//  Created by Mostafa Davoodi on 7/2/22.
//

import Foundation
import Alamofire

class NetworkingLayerAF {
	let baseUrl = "http://localhost:3000/todos"
	
	
	func getAllTodos() {
//		#1
//		AF.request(baseUrl).response { response in
//			debugPrint(response)
//		}
		
//		#2
//		Session.default.request(baseUrl).responseDecodable(of: [TodoModel].self) { response in
		AF.request(baseUrl).responseDecodable(of: [TodoModel].self) { response in
			switch response.result {
			case .success(let items):
				print(items)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func createNewItem(body: NoteBody) {
//		#1
//		let params = [
//			"note": body.note
//		]
//		AF.request(baseUrl, method: .post, parameters: params).responseDecodable(of: TodoModel.self) { response in
//			switch response.result {
//			case .success(let item):
//				print(item)
//			case .failure(let error):
//				print(error.localizedDescription)
//			}
//		}
		
//		#2
		AF.request(baseUrl, method: .post, parameters: body, encoder: JSONParameterEncoder.default).responseDecodable(of: TodoModel.self) { response in
			switch response.result {
			case .success(let item):
				print(item)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
//		let headers: HTTPHeaders = [
//			.authorization(username: "johndoe", password: "abcd1234"),
//			.accept("application/json")
//		]
	}
	
	func getSingleItem(id: String) {
		AF.request("\(baseUrl)/\(id)")
			.responseDecodable(of: TodoModel.self) { response in
			switch response.result {
			case .success(let item):
				print(item)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func updateSingleItem(id: String, note: String) {
		let params = [
			"note": note
		]
		AF.request("\(baseUrl)/\(id)", method: .put, parameters: params).responseDecodable(of: TodoModel.self) { response in
			switch response.result {
			case .success(let item):
				print(item)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func deleteSingleItem(id: String) {
		AF.request("\(baseUrl)/\(id)", method: .delete).responseDecodable(of: TodoModel.self) { response in
			switch response.result {
			case .success(let item):
				print(item)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func otherSamples(id: String) {
		// validate status code
		AF.request("\(baseUrl)/\(id)")
			.validate(statusCode: 200..<300)
			.responseDecodable(of: TodoModel.self) { response in
			switch response.result {
			case .success(let item):
				print(item)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		// have response as a json
		AF.request("\(baseUrl)/\(id)")
			.validate(statusCode: 200..<300)
			.responseJSON { response in
				switch response.result {
				case .success(let data):
					print(data)
				case .failure(let error):
					print(error.localizedDescription)
				}
			}
	}
	
}
