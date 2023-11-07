//
//  PostsRequest.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-06.
//

import Foundation

struct GetPostsRequest: RequestProtocol {
    let path: Path = .posts
    let httpMethod: HTTPMethod = .GET
    let cachePolicy: URLRequest.CachePolicy = .reloadRevalidatingCacheData
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host.rawValue
        urlComponents.path = path.rawValue
        return urlComponents.url
    }
    
    #warning("Should probably be abstracted away into a RequestBuilder object")
    func request() throws -> URLRequest {
        guard let url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.httpMethod = httpMethod.httpMethod
        return request
    }
}
