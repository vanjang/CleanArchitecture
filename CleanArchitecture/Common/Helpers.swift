//
//  Helpers.swift
//  CleanArchitecture
//
//  Created by myung hoon on 24/04/2024.
//

import Foundation

var apiKey: String {
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "RIJKS Museum API Key") as? String else {
        fatalError("API Key in either info.plist or config file is missing!")
    }
    return apiKey
}
