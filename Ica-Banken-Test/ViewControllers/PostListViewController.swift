//
//  ViewController.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-06.
//

import UIKit
import SwiftUI

class PostListViewController: UIViewController {
    
    private let viewModel: PostListViewModel
    
    init(viewModel: PostListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSwiftUI(view: PostListView(viewModel: viewModel))
    }
}

#Preview {
    PostListViewController(viewModel: .init(networkService: NetworkService()))
}
