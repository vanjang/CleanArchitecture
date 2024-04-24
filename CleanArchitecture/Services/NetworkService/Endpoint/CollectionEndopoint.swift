//
//  CollectionEndopoint.swift
//  CleanArchitecture
//
//  Created by myung hoon on 23/04/2024.
//

import Foundation

struct CollectionEndopoint: Endpoint {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var parameters: [URLQueryItem]?
    var headers: [String : String]?
}
