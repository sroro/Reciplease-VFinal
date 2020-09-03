//
//  ViewController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 26/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class HomeViewController: UIViewController {
    var dataReciplease = RequestService()
    var array = [String]()
    
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    //MARK: - IBActions
    
    @IBAction func addIngredientButton(_ sender: Any) {
        guard let text = ingredientTextField.text else { return }
        array.append(text)
        ingredientTableView.reloadData() 
    }
    
    @IBAction func clearIngredientButton(_ sender: Any) {
        array.removeAll()
        ingredientTableView.reloadData()
    }
    
    @IBAction func searchRecipesButton(_ sender: Any) {
        dataReciplease.getData() { result in
            switch result {
            case .success(let data):
                print(data.hits)
                self.performSegue(withIdentifier: "segueToTableView", sender: nil)
            case.failure(let error):
                let alertVC = UIAlertController(title: "Error", message: "No Recipe Found", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "Error", style: .default, handler: nil))
                self.present(alertVC, animated: true , completion: nil)
                print(error.localizedDescription)
                // mettre ALERTE
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - extension UITableView

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourIngredientCell", for: indexPath)
        cell.textLabel?.text = ("\(array[indexPath.row])")
        return cell
    }
    
}



