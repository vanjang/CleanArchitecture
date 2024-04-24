//
//  CollectionDataTransferService.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Combine

final class CollectionDataTransferService {
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
}

extension CollectionDataTransferService: DataTransferService {
    func request<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, Error> {
        networkService.request(endpoint).eraseToAnyPublisher()
    }
}
