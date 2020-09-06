//
//  Alert.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 06/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

extension  UIViewController {
    func alert() {
        let alertVC = UIAlertController(title: "Error", message: "No Recipe Found", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Error", style: .default, handler: nil))
        self.present(alertVC, animated: true , completion: nil)
    }
}
