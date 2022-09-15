//
//  FakeResponseData.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 14/01/2021.
//  Copyright © 2021 Rodolphe Schnetzer. All rights reserved.
//

import Foundation
class FakeResponseData {
    
   static let responseOk = HTTPURLResponse(url: URL(string: "https://www.edamam.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
   static let responsoKo = HTTPURLResponse(url: URL(string: "https://www.edamam.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
    
    
    class NetworkError: Error {}
    static let networkError = NetworkError()
    
    static var correctData: Data{
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Reciplease", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let incorrectData = "erreur".data(using: .utf8)!
}



