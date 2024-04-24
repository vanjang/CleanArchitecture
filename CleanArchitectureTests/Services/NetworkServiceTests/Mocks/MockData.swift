//
//  MockData.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 24/04/2024.
//

import Foundation
import XCTest
@testable import CleanArchitecture

struct MockData {
    static let url = Bundle(for: NetworkServiceTests.self).url(forResource: "MockJSON", withExtension: "json")
    
    static var collectionData: Data {
        guard let resourceUrl = url, let data = try? Data(contentsOf: resourceUrl) else {
            XCTFail("Failed to create data object.")
            return Data()
        }
        return data
    }
}
