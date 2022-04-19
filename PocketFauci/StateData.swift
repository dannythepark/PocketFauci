//
//  StateData.swift
//  PocketFauci
//
//  Created by Danny Park on 4/19/22.
//

import Foundation

struct StateData: Codable {
    var state: String
    var positive: Int
    var hospitalizedCurrently: Int?
    var death: Int
}
