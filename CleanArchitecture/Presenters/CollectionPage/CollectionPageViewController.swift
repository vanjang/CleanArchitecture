//
//  CollectionPageViewController.swift
//  CleanArchitecture
//
//  Created by myung hoon on 24/04/2024.
//

import UIKit
import SwiftUI

final class CollectionPageViewController: UIViewController {
    private let vc: UIHostingController<CollectionPageView>
    
    init(viewModel: CollectionPageViewModel) {
        vc = UIHostingController(rootView: CollectionPageView(viewModel: viewModel))
        
        super.init(nibName: nil, bundle: nil)
        setUpHostingController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // to re-size view when rotating
        vc.view.frame = view.bounds
    }
    
    private func setUpHostingController() {
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
