//
//  ViewController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 26/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    var dataReciplease = RequestService()
    var arrayIngredients = [String]()
    var dataRecipes : RecipeJSON?
    
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    //MARK: - IBActions
    
    @IBAction func addIngredientButton(_ sender: Any) {
        guard let text = ingredientTextField.text else { return }
        arrayIngredients.append(text)
        ingredientTableView.reloadData()
    }
    
    @IBAction func clearIngredientButton(_ sender: Any) {
        arrayIngredients.removeAll()
        ingredientTableView.reloadData()
    }
    
    @IBAction func searchRecipesButton(_ sender: Any) {
        guard let ingredients = ingredientTextField.text, !ingredients.isEmpty else {
            self.alertAddIngredient()
            return
        }
        dataReciplease.getData(ingredient:arrayIngredients.joined(separator: ",")) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataRecipes = data
                    self.performSegue(withIdentifier: "segueToTableView", sender: nil)
                }
            case.failure(let error):
                self.alertError()
                print(error.localizedDescription)
            }
        }
    }
    // passage de données
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTableView" {
            let vcDestination = segue.destination as? ListRecipes
            vcDestination?.infoRecipes = dataRecipes
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - extension UITableView

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourIngredientCell", for: indexPath)
        cell.textLabel?.text = arrayIngredients[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }
    
}



