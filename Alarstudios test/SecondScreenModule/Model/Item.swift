//
//  Item.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

struct Item: Codable {
    let status: String
    let page: Int
    let data: [Datum]
}

struct Datum: Codable {
    let id: String
    let name: String
    let country: String
    let lat: Double
    let lon: Double
}
