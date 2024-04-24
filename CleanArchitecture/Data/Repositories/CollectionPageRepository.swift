//
//  CollectionPageRepository.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Foundation
import Combine

final class CollectionPageRepository {
    private let apiDataTransferService: DataTransferService
    
    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
    
}
extension CollectionPageRepository: CollectionPageRepositoryType {
    func fetchCollection(load: PassthroughSubject<Void, Never>) -> AnyPublisher<Collection, Error> {
        load
            .setFailureType(to: Error.self)
            .scan(0) { last, currnet in last + 5 }
            .map { offset -> CollectionEndopoint in
                let queryItems: [URLQueryItem] = [URLQueryItem(name: "p", value: "\(offset)"),
                                                  URLQueryItem(name: "ps", value: "\(5)"),
                                                  URLQueryItem(name: "key", value: apiKey)]
                return CollectionEndopoint(baseURL: "https://www.rijksmuseum.nl/api/nl/collection?key=arSaMluv", path: "", method: .get, parameters: queryItems)
            }
            .flatMapLatest { [unowned self] endpoint in
                let collection: AnyPublisher<Collection, Error> = self.apiDataTransferService.request(endpoint: endpoint)
                return collection
            }
            .scan(Collection(artObjects: []), { last, current in
                Collection(artObjects: last.artObjects + current.artObjects)
            })
            .eraseToAnyPublisher()
    }
}
