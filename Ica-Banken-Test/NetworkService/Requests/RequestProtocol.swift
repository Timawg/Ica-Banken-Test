//
//  RequestProtocol.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-06.
//

import Foundation

protocol RequestProtocol {
    var scheme: Scheme { get }
    var host: Host { get }
    var path: Path { get }
    var httpMethod: HTTPMethod { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var url: URL? { get }
    func request() throws -> URLRequest
}

extension RequestProtocol {
    var scheme: Scheme {
        return .https
    }
    
    var host: Host {
        return .jsonplaceholder
    }
}
