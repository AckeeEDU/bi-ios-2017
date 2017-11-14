//
//  Recipe.swift
//  BI-IOS
//
//  Created by Dominik Vesely on 06/11/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation

// {"name":"Ackee and Saltfish","duration":10,"id":"5a00be7f0898a11000146b64","score":0}
struct Recipe : Codable {
    var name : String
    var duration : Int
    var id : String
    var score : Double
    var rating: Int?
}
