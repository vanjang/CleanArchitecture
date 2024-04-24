//
//  CollectionPageRepositoryTests.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 23/04/2024.
//

import XCTest
import Combine
@testable import CleanArchitecture

final class CollectionPageRepositoryTests: XCTestCase {
    
    var cancellables: [AnyCancellable] = []
    
    func testCollectionPagePagination() throws {
        // GIVEN
        let apiDataTransferService = CollectionDataTransferService(networkService: NetworkService())
        let repo = CollectionPageRepository(apiDataTransferService: apiDataTransferService)
        let loadNext = PassthroughSubject<Void, Never>()
        let expectation = expectation(description: "pagination")
        var artObjects: [ArtObject] = []
        var numberOfLoads = 0
        
        repo.fetchCollection(load: loadNext)
            .replaceError(with: Collection(artObjects: []))
            .sink { collection in
                artObjects = collection.artObjects
                numberOfLoads = numberOfLoads + 1
                if numberOfLoads == 3 {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        // WHEN
        loadNext.send(())
        loadNext.send(())
        loadNext.send(())
        
        // THEN
        waitForExpectations(timeout: 5.0)
        XCTAssert(artObjects.count == 15)
    }
}
