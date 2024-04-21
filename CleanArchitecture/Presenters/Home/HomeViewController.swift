//
//  HomeViewController.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import UIKit
import Combine

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModelType
    private let proceedButtonTap = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = HomeView()
    }
    
    private func bind() {
        guard let view = self.view as? HomeView else { return }
        
        view.proceedButton.addTarget(self, action: #selector(proceedButtonTapped(_:)), for: .touchUpInside)
        
        let input = HomeViewModelInput(proceedButtonTap)
        
        viewModel.connect(input: input)
            .sink(receiveValue: view.configure)
            .store(in: &cancellables)
    }
    
    @objc func proceedButtonTapped(_ sender: UIButton) {
        proceedButtonTap.send(())
      }
}
