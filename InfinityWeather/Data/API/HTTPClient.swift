//
//  URLSessionProtocol.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//


//
//  HTTPClient.swift
//  Youtube-SwiftUI-Code-Adventure
//
//  Created by Orisajobi Akinbola on 4/9/25.
//

 

import Foundation

typealias Token = String

protocol URLSessionProtocol {
    func data(
        for request: URLRequest,
        delegate: (URLSessionTaskDelegate)?
    ) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

protocol HTTPClient {
   
    func sendRequest<T: Decodable>(_ request: URLRequest, urlSession: URLSessionProtocol, responseModel: T.Type, allowRetry: Bool,  keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy, refreshToken: String?) async -> Result<T, RequestError>
}


extension HTTPClient {
    
    func sendRequest<T: Decodable>(_ request: URLRequest, urlSession: URLSessionProtocol = URLSession.shared, responseModel: T.Type, allowRetry: Bool = true, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, refreshToken: String? = nil) async -> Result<T, RequestError> {
        
        
 
        guard let url = request.url else { return .failure(.invalidURL(nil))}
        
        do {
            
            let (data, response) = try await urlSession.data(for: request, delegate: nil)
 
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse(nil))
            }
            
            print("\n\nResponse")
            print(String(data: data, encoding: .utf8)!)
            print(response.statusCode)
        
           // dump(response)
            
            dump(request)
            switch response.statusCode {
            
            case 204:
                
                return .success(204 as! T)
            case 200...299:
                 let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = keyDecodingStrategy
 
             
                let result = try decoder.decode(T.self, from: data)
                
                return .success(result)
            case 400:
                //                dump(data)
              //  print(String(data: data, encoding: .utf8)!)

                return .failure(.badRequest(nil))
                
            case 401:
                return .failure(.unauthorized)
            case 404:
                return .failure(RequestError.notFound)
            case 500...599:
                return .failure(.server)
            default:
                let decoder = JSONDecoder()
               decoder.keyDecodingStrategy = keyDecodingStrategy

            
              //  let result = try decoder.decode(ArticleErrorResponse.self, from: data)
               
                return .failure(.unexpected())
            }
        } catch  {
             if error is Swift.DecodingError {
                return .failure(.unexpected("Something went wrong.Contact Support"))
            }
            guard let urlError = error as? URLError else {return .failure(.unexpected(nil))}
           
            switch urlError.code {
        
            case .notConnectedToInternet,
                 .dataNotAllowed:
                return .failure(.addressUnreachable(url))
            case .timedOut:
                return .failure(.unexpected("Request timed out. Try again"))
       
             default:
                return .failure(.unexpected(nil))
            }
           
        }
    }
    
}

