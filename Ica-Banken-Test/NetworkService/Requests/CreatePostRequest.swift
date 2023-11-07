//
//  CreatePostRequest.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-07.
//

import Foundation

struct CreatePostRequest: RequestProtocol {
    
    let body: Encodable?
    let path: Path = .posts
    let httpMethod: HTTPMethod = .POST    
    let cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host.rawValue
        urlComponents.path = path.rawValue
        return urlComponents.url
    }
    
    func request() throws -> URLRequest {
        guard let url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.httpMethod = httpMethod.rawValue
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        return request
    }
}
