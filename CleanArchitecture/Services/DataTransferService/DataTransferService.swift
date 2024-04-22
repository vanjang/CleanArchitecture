//
//  DataTransferService.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Combine

protocol DataTransferService {
    func request<T: Decodable>() -> AnyPublisher<(Result<T, Error>), Never>
}
