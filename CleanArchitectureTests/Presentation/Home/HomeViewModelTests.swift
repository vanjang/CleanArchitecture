//
//  HomeViewModelTests.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 21/04/2024.
//

import XCTest
import Combine
@testable import CleanArchitecture

final class HomeViewModelTests: XCTestCase {
    private var cancellables: [AnyCancellable] = []
    private let proceedButtonTap = PassthroughSubject<Void, Never>()
    private let pushToAboutPageTap = PassthroughSubject<Void, Never>()
    private var didProceedButtonTap = false
    
    func makeMockHomeRepository() -> HomeViewRepositoryType {
        MockHomeViewRepository()
    }
    
    func makeMockHomeUseCase() -> HomeViewUseCaseType {
        MockHomeViewUseCase(mockRepository: makeMockHomeRepository())
    }
    
    func makeMockHomeViewModel() -> HomeViewModelType {
        MockHomeViewModel(useCase: makeMockHomeUseCase(), action: HomeViewModelAction(pushToCollection: pushToCollection, pushToAboutPage: pushToAboutPage))
    }
    
    func pushToCollection() {
        didProceedButtonTap = !didProceedButtonTap
    }
    
    func pushToAboutPage() {
        
    }
    
    func testHomeViewModelOutput() throws {
        let viewModel = makeMockHomeViewModel()
//        let input = HomeViewModelInput(Just(()))
        let input = HomeViewModelInput(proceedButtonTap: proceedButtonTap.eraseToAnyPublisher(), aboutButtonTap: pushToAboutPageTap.eraseToAnyPublisher())
        let output = viewModel.connect(input: input)
        let expectation = expectation(description: "image name")
        var imageName = ""
        
        output
            .sink { imageString in
                imageName = imageString
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1.0)
        
        XCTAssertEqual(imageName, "mockImageString")
        XCTAssertNotEqual(imageName, "wrong image name")
    }
    
    func testHomeViewModelInput() throws {
        let viewModel = makeMockHomeViewModel()
        let input = HomeViewModelInput(proceedButtonTap: proceedButtonTap.eraseToAnyPublisher(), aboutButtonTap: pushToAboutPageTap.eraseToAnyPublisher())
        let output = viewModel.connect(input: input)
        
        proceedButtonTap.send(())
        XCTAssert(didProceedButtonTap)
        
        proceedButtonTap.send(())
        XCTAssert(!didProceedButtonTap)
        
        proceedButtonTap.send(())
        XCTAssert(didProceedButtonTap)
    }
}
