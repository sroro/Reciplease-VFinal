//
//  MockSession.swift
//  RecipleaseTests
//
//  Created by Rodolphe Schnetzer on 25/01/2021.
//  Copyright © 2021 Rodolphe Schnetzer. All rights reserved.
//

import Foundation
@testable import Reciplease
import Alamofire

struct FakeResponse {
    var response: HTTPURLResponse?
    var data : Data?
}

class MockReciplease : Alamo {
    
    private let fakeResponse:FakeResponse
    
    init(fakeResponse : FakeResponse) {
    self.fakeResponse = fakeResponse
    }
    
    func request(with url: URL, callBack: @escaping (AFDataResponse<Any>) -> Void) {
        let dataResponse = AFDataResponse<Any>(request: nil, response: fakeResponse.response, data: fakeResponse.data, metrics: nil, serializationDuration: 0, result: .success("OK"))
        callBack(dataResponse)
    }
    
    
    
    
}
