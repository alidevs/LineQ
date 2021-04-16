//
//  Restaurant.swift
//  LineQ
//
//  Created by Ali Alateiyah on 15/04/2021.
//

import Foundation

struct Restaurant: Decodable {
	public private(set) var name: String!
	public private(set) var category: String!
	public private(set) var url: String!
	public private(set) var phone: String!
	public private(set) var imageUrl: String!
	public private(set) var description: String!
}
