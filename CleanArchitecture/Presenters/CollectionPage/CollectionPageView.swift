//
//  CollectionPageView.swift
//  CleanArchitecture
//
//  Created by myung hoon on 24/04/2024.
//

import SwiftUI

struct CollectionPageView: View {
    @ObservedObject var viewModel: CollectionPageViewModel
    
    init(viewModel: CollectionPageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.listItems) { item in
                    Text(item.title)
                        .frame(height: 50)
                }
            }
        }
        .padding()
        .background(.white)
        .onAppear {
            viewModel.viewDidLoad.send()
        }
    }
}
