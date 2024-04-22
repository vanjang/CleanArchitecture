//
//  ArtObject.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Foundation

struct ArtObject: Decodable {
    let links: Links
    let id: String
    let objectNumber: String
    let title: String
    let longTitle: String
    let headerImage: HeaderImage
}
