//
//  RequestInterceptor.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation
import Alamofire

final class RequestInterceptor: Alamofire.RequestInterceptor {
    
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ .eyJpZCI6IjY1M2ZjZDRmYTU5ODExNmIzN2I4YzIxYiIsImlhdCI6MTcwMDI4NTQ3OSwiZXhwIjoxNzAzODg1NDc5f .6u_-VBP7TUZTGL90XOGgaDUTdC7IvQ6fgBDCJOHWgyI"
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        urlRequest.setValue("Bearer " + token, forHTTPHeaderField: "Autorization")
        completion(.success(urlRequest))
    }
}
