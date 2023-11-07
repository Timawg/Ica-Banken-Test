//
//  SwiftUIView.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-06.
//

import SwiftUI

struct PostListView: View {
    
    @ObservedObject var viewModel: PostListViewModel
    
    var body: some View {
        List(viewModel.posts) { post in
            VStack {
                Text(post.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    Spacer()
                Text(post.body)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
            }
        }.onAppear(perform: {
            viewModel.getPost()
        })
    }
}

#Preview {
    PostListView(viewModel: .init(networkService: NetworkService()))
}
