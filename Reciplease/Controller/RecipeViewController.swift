//
//  RecipeController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 02/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import SDWebImage

final class RecipeViewController: UIViewController {
    
    //MARK: - properties
    
    var recipeDetails : RecipeDetails?
    private var coreDataManager : CoreDataManager?
    private var favorite = false
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageTest = recipeDetails?.image else { return }
        recipeImage.image = UIImage(data: imageTest)
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coredataStack = appdelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coredataStack)
    }
    
    // permet de garder l'icon rempli quand la recette est en favorite
    override func viewWillAppear(_ animated: Bool) {
        guard let recipeName = recipeDetails?.name else { return }
        if coreDataManager?.isRecipeRegistered(name: recipeName ) == true {
            favoriteButton.image = UIImage(systemName: "star.fill")
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func tappedDirectionRecipe(_ sender: UIButton) {
        guard let url = URL(string: recipeDetails!.url)  else  { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func favoriteTapButton(_ sender: UIBarButtonItem) {
        guard let coreDataManager = coreDataManager else { return }
        guard let recipe = recipeDetails else { return }
        
        switch coreDataManager.isRecipeRegistered(name: recipe.name) {
        //si la recette est en favoris , la supprimer
        case true:
            sender.image = UIImage(systemName: "star")
            coreDataManager.deleteRecipe(name: recipe.name)
            
            if tabBarController?.selectedIndex == 1 { // index tabBar
            navigationController?.popViewController(animated: true)  // revient au conroller precedent qd la recette n'est plus en favoris
            }

        case false:
            // si la recette n'est pas en favoris , l'ajouter et modifier l'icone
            sender.image = UIImage(systemName: "star.fill")
            // ajouter la recette en favoris
            coreDataManager.createTask(name: recipe.name, calories: recipe.calories , time: recipe.time, ingredients: recipe.ingredients, url: recipe.url, image: recipe.image)
        }
    }
}

extension RecipeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeDetails?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientRecipeCell", for: indexPath)
        guard let ingredientsRecipe = recipeDetails?.ingredients[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = ingredientsRecipe
        return cell
    }
}

