//
//  DataReciplease.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 28/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import Foundation
import Alamofire

protocol Alamo {
    func request(with url: URL, callBack: @escaping (DataResponse<Any>) -> Void)
}

class DataReciplease:Alamo {
    func request(with url: URL, callBack: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(url).validate().responseJSON { (responseData) in
            callBack(responseData)
        }
    }
}



