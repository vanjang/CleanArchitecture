//
//  Endpoint.swift
//  CleanArchitecture
//
//  Created by myung hoon on 23/04/2024.
//

import Foundation

/// Protocol defining the requirements for an API endpoint.
protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
}
