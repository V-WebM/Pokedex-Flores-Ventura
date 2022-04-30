//
//  PokeDetailViewController.swift
//  ProjectMVVM
//
//  Created by Juan Renato on 30/04/22.
//

import UIKit

class PokeDetailViewController: UIViewController {

    //
    
    var url: String = ""
    
    var pokemon : PokeDetail? = nil
    
    let pokeViewModel : PokeViewModel = PokeViewModel()
    
    @IBOutlet weak var lblNamePokemon: UILabel!
    @IBOutlet weak var lblImagePokemon: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpView()
        }
    }
    func setUpView() async {
        await pokeViewModel.getPokeDetail(url: url)
        pokemon = pokeViewModel.pokemon
        setUpPokeData()
    }
    func setUpPokeData() {
        view.backgroundColor = PokeTypes.types[(pokemon?.types[0].type.name)!]
        lblNamePokemon.text = pokemon?.name.capitalized
        lblType.text = pokemon?.types[0].type.name.capitalized ?? ""
        lblImagePokemon.image = HelperImage.setImageFromUrl(url: (pokemon?.sprites.other.officialArtwork.front_default)!)
    }
}
