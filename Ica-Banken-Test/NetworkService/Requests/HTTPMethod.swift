//
//  HTTPMethod.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-07.
//

import Foundation

enum HTTPMethod {
    case GET
    case POST(_ body: Encodable?)
    case PUT(_ body: Encodable?)
    case PATCH(_ body: Encodable?)
    case DELETE
    
    var httpMethod: String {
        switch self {
        case .GET:
            return "GET"
        case .DELETE:
            return "DELETE"
        case .PATCH: return "PATCH"
        case .POST: return "POST"
        case .PUT: return "PUT"
        }
    }
    
    #warning("This should probably reside in the request objects or a request builder")
    var body: Encodable? {
        switch self {
        case .PATCH(let body), .POST(let body), .PUT(let body): 
            return body
        case .GET, .DELETE: 
            return nil
        }
    }
}
