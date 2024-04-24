//
//  File.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 24/04/2024.
//

import Foundation
@testable import CleanArchitecture

struct MockCollectionEndopoint: Endpoint {
    var baseURL: String
    var path: String = ""
    var method: HTTPMethod = .get
    var parameters: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
}
