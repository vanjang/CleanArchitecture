//
//  CollectionPageViewModel.swift
//  CleanArchitecture
//
//  Created by myung hoon on 24/04/2024.
//

import Combine

final class CollectionPageViewModel: ObservableObject {
    // MARK: - Input
    let viewDidLoad = PassthroughSubject<Void, Never>()
    @Published var listItems: [CollectionPageListItem] = []
    
    private var cancellables: [AnyCancellable] = []
    
    private let useCase: CollectionPageUseCaseType
    
    init(useCase: CollectionPageUseCaseType) {
        self.useCase = useCase
        bindListItems()
    }
    
    func bindListItems() {
        useCase.getArtObject(load: viewDidLoad)
            .map { artObjects -> [CollectionPageListItem] in
                artObjects
                    .map { CollectionPageListItem(id: $0.id, title: $0.title) }
            }
            .sink { _ in
                //
            } receiveValue: { [weak self] items in
                self?.listItems = items
            }
            .store(in: &cancellables)
    }
}
