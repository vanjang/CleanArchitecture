//
//  LocalDataService.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Foundation

protocol LocalDataServiceType {
    var infoDictionary: [String : Any]? { get }
}

final class LocalDataService: LocalDataServiceType {
    var infoDictionary: [String : Any]? {
        Bundle.main.infoDictionary
    }
}
