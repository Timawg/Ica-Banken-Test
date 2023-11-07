//
//  PostListViewModel.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-07.
//

import Foundation

final class PostListViewModel: ObservableObject {
    
    private let networkService: NetworkServiceProtocol
    private let filterLimit = 50
    @Published var posts: [Post] = []
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    @MainActor
    func getPost(){
        let request = GetPostsRequest()
        Task {
            let posts: [Post] = try await networkService.perform(request: request)
            self.posts = posts.filter { $0.id < filterLimit }
        }
    }
}
