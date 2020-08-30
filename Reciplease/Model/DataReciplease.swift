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
    var url = "https://api.edamam.com/search?q=chicken,cheese&app_id=d4ca1968&app_key=b9eb6ef419398c1454c809899be163c6&from=0&to=1"
    func request(with url: URL, callBack: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(url).validate().responseJSON { (response) in
            callBack(response)
        }
    }
    
 
    
    }



