//
//  JSONData.swift
//  SimpleAPITest
//
//  Created by Joe McGuinness on 30/04/2021.
//

import Foundation

struct RootObjectData: Decodable {
	var title: String
	var userId: Int
	var id: Int
	var completed: Bool
}
