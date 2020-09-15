//
//  String.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 14/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import Foundation

/// separe le text en tableau sans les ponctuations

extension String {
    var transformToArray : [String] {
        return self.components(separatedBy: .punctuationCharacters).joined().components(separatedBy: " ").filter {!$0 .isEmpty }
    }
}
