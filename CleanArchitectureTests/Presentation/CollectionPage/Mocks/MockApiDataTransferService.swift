//
//  MockApiDataTransferService.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 23/04/2024.
//

import Foundation
import Combine

@testable import CleanArchitecture

final class MockApiDataTransferService: DataTransferService {
    private let networkService: MockNetworkService
    
    init(networkService: MockNetworkService) {
        self.networkService = networkService
    }
    func request<T>(endpoint: Endpoint) -> AnyPublisher<T, Error> where T : Decodable {
        networkService.request(endpoint)
    }
}
