//
//  Publisher+Extension.swift
//  CleanArchitecture
//
//  Created by myung hoon on 23/04/2024.
//

import Foundation
import Combine

extension Publisher {
    func flatMapLatest<T: Publisher>(_ transform: @escaping (Self.Output) -> T) -> Publishers.SwitchToLatest<T, Publishers.Map<Self, T>> where T.Failure == Self.Failure {
        map(transform).switchToLatest()
    }
    
    static func empty() -> AnyPublisher<Output, Failure> {
        return Empty().eraseToAnyPublisher()
    }

    static func just(_ output: Output) -> AnyPublisher<Output, Failure> {
        return Just(output)
            .setFailureType(to: Failure.self)
            .eraseToAnyPublisher()
    }

    static func fail(_ error: Failure) -> AnyPublisher<Output, Failure> {
        return Fail(error: error).eraseToAnyPublisher()
    }
}

extension Publisher where Output == (data: Data, response: URLResponse), Failure == URLError {
    func cache<T: Decodable>(using cache: URLCache, for request: URLRequest, with type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        return map { (data, response) in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let cachedResponse = CachedURLResponse(response: httpResponse, data: data)
                cache.storeCachedResponse(cachedResponse, for: request)
            }
            return data
        }
        .decode(type: T.self, decoder: decoder)
        .eraseToAnyPublisher()
    }
}

