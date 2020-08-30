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
var dataReciplease = DataReciplease()
    
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBAction func addIngredientButton(_ sender: Any) {
        
        let text = ingredientTextField.text!
        tableau.append(text)
        ingredientTableView.reloadData()
        print(tableau)

    }
    @IBAction func clearIngredientButton(_ sender: Any) {
        tableau.removeAll()
        ingredientTableView.reloadData()
    }
    @IBAction func searchRecipesButton(_ sender: Any) {
    }

    var tableau = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableau.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourIngredientCell", for: indexPath)
        cell.textLabel?.text = ("\(tableau[indexPath.row])")
        return cell
    }


}
extension HomeViewController: UITableViewDelegate {

}



