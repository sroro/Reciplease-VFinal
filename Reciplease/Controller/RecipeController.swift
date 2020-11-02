//
//  RecipeController.swift
//  Reciplease
//
//  Created by Rodolphe Schnetzer on 02/09/2020.
//  Copyright © 2020 Rodolphe Schnetzer. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeController: UIViewController {
    var recipeSelected : Recipe?
    var favorite = false
    var coreDataManager : CoreDataManager?
    
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    @IBAction func tappedDirectionRecipe(_ sender: UIButton) {
        guard let url = URL(string: recipeSelected!.url)  else  { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add the image on the recipe selected
        recipeImage.sd_setImage(with: URL(string: recipeSelected!.image), placeholderImage: UIImage(named: "image"))
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coredataStack = appdelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coredataStack)
    }
    
    // permet de garder l'icon rempli quand la recette est en favorite
    override func viewWillAppear(_ animated: Bool) {
        guard let recipeName = recipeSelected?.label else { return }
        if coreDataManager?.isRecipeRegistered(name: recipeName ) == true {
            favoriteButton.image = UIImage(systemName: "star.fill")
        }
    }
    
    @IBAction func favoriteTapButton(_ sender: UIBarButtonItem) {
        
        guard let coreDataManager = coreDataManager else { return }
        guard let recipe = recipeSelected else { return }
        guard let recipeName = recipeSelected?.label else { return }
        guard let recipeTime = recipeSelected?.totalTime else { return }
        let recipeConvertTime = String(recipeTime)
        
        switch coreDataManager.isRecipeRegistered(name: recipeName) {
        case true:
            sender.image = UIImage(systemName: "star")
            alertDeleteRecipeFavorite()
            coreDataManager.deleteRecipe(name: recipeName)
        // supprimer la recette
        // add coreData
        case false:
            
            sender.image = UIImage(systemName: "star.fill")
            alertAddRecipeFavorite()
            // ajouter la recette en favoris
            coreDataManager.createTask(name: recipeName, calories: recipe.calories, time: recipeConvertTime, ingredients: recipe.ingredientLines, url: recipe.url, image: recipe.image.data)

        }
    }
    
}

extension RecipeController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeSelected!.ingredientLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientRecipeCell", for: indexPath)
        guard let ingredientsRecipe = recipeSelected?.ingredients[indexPath.row].text else { return UITableViewCell() }
        cell.textLabel?.text = ingredientsRecipe
        return cell
    }
}




