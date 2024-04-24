//
//  LocalDataTransferService.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Combine

final class LocalDataTransferService {
    let localDataService: LocalDataServiceType
    
    init(localDataService: LocalDataServiceType) {
        self.localDataService = localDataService
    }
}

extension LocalDataTransferService: DataTransferService {
    func request<T: Decodable>() -> AnyPublisher<T, Error> {
        var defaultImageString = "frans_hals"
        if let infoDict = localDataService.infoDictionary {
            if let value = infoDict["Home View Image String"] as? String {
                defaultImageString = value
            }
        }
        
        return Just(defaultImageString as! T)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
