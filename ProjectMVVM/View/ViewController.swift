//
//  ViewController.swift
//  ProjectMVVM
//
//  Created by Linder Anderson Hassinger Solano    on 22/04/22.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let pokeViewModel: PokeViewModel = PokeViewModel()
    
    var filterData : [Result] = []
    var urlToDetail : String? = nil
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            await setUpData()
        }
       setUpView()
    }
    
    func setUpData() async {
        await pokeViewModel.getDataFromAPI()
        filterData = pokeViewModel.pokemons
        tableView.reloadData()
    }
    
    func setUpView(){
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        navigationItem.backButtonTitle = " "
    }
}

// creamos una extension del viewController

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = filterData[indexPath.row].name.capitalized
        cell.imageView?.image = HelperImage.setImage(id: HelperString.getIdFromUrl(url: filterData[indexPath.row].url))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        urlToDetail = filterData[indexPath.row].url
        performSegue(withIdentifier: "detail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let pokeDetailView = segue.destination as! PokeDetailViewController
            pokeDetailView.url = urlToDetail!
            
        }
    }
}



// extension para mi search

extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = searchText.isEmpty
        ? pokeViewModel.pokemons
        : pokeViewModel.pokemons.filter({(pokemon : Result) -> Bool in
            return pokemon.name.range(of: searchText, options : .caseInsensitive, range:nil, locale: nil ) != nil
    })
    tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}


