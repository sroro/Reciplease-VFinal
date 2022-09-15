//
//  ViewController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 26/08/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private  let dataReciplease = RequestService()
    private  var arrayIngredients = [String]()
    private  var dataRecipes : RecipeJSON?
    
    // MARK: - Outlets
    
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    // MARK: - ViewLifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        ingredientTextField.backgroundColor? = .white
    }
    
    //MARK: - IBActions
    
    @IBAction func addIngredientButton(_ sender: Any) {
        guard let ingredients = ingredientTextField.text, !ingredients.isEmpty else {
            self.alertAddIngredient()
            return
        } 
        guard let text = ingredientTextField.text else { return }
        let _ = text.transformToArray.forEach {arrayIngredients.append($0)}
        ingredientTableView.reloadData()
    }
    
    @IBAction func clearIngredientButton(_ sender: Any) {
        arrayIngredients.removeAll()
        ingredientTableView.reloadData()
    }
    
    @IBAction func searchRecipesButton(_ sender: Any) {
        
        // arrayIngredients.map{$0}.joined(separator: ",") = transformer le tableau en string sans espace
        dataReciplease.getData(ingredient:arrayIngredients.map{$0}.joined(separator: ",")) { result in
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
    
    // passage de données vers controller RecipeListVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTableView" {
            let vcDestination = segue.destination as? RecipeListViewController
            vcDestination?.recipes = dataRecipes?.hits
        }
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




