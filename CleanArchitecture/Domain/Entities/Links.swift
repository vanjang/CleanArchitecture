//
//  Links.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Foundation

struct Links: Decodable {
    let selfLink: String
    let web: String
    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case web = "web"
       }
}
