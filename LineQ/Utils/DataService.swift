//
//  User.swift
//  LineQ
//
//  Created by Ali Alateiyah on 15/04/2021.
//

import Foundation
import Firebase

class DataService {
	
	// Instance
	static let instance = DataService()
	
	private let dummyData = [
		Restaurant(name: "McDonald's", category: "Fast food", url: "url", phone: "phone", imageUrl: "url", description: "desc"),
		Restaurant(name: "KFC", category: "Fast food", url: "url", phone: "phone", imageUrl: "url", description: "desc"),
		Restaurant(name: "Kudu", category: "Fast food", url: "url", phone: "phone", imageUrl: "url", description: "desc"),
	]
	
	public func getDummyData() -> [Restaurant] {
		return dummyData
	}
	
	public func searchRestaurant(completion: @escaping ([Restaurant]) -> Void) -> [Restaurant] {
		let ref = Database.database(url: "https://lineq-c30c3-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("restaurants")
		var restaurants = [Restaurant]()
		
		ref.observeSingleEvent(of: .value) { (snapshot) in
			guard let dict = snapshot.value as? [String: Any] else { return completion([]) }
			
			for (_, value) in dict {
				guard let value = value as? [String: [String: Any]] else { return }
				for (_, v) in value {
					guard let name = v["name"],
						  let category = v["category"],
						  let url = v["url"],
						  let phone = v["phone"],
						  let imageUrl = v["imageUrl"],
						  let description = v["description"]
						  else { return }
					
					let restaurant = Restaurant(name: "\(name)",
												category: "\(category)",
												url: "\(url)",
												phone: "\(phone)",
												imageUrl: "\(imageUrl)",
												description: "\(description)")
					
					restaurants.append(restaurant)
					print(restaurant)
					restaurants = restaurants.sorted { $0.name < $1.name }
					completion(restaurants)
				}
			}
		}
		
		return restaurants
	}
}
