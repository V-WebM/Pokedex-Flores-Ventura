//
//  PokeTypes.swift
//  ProjectMVVM
//
//  Created by Juan Renato on 30/04/22.
//

import Foundation
import UIKit

enum PokeTypes {
    static let types :  [String :UIColor] = [
        "Water" : UIColor(red: 20/255, green: 219/255, blue: 178/255, alpha: 1),
        "grass" : UIColor.green,
        "fire" : UIColor(red: 255/255, green: 70/255, blue: 33/255, alpha: 1),
        "normal" : UIColor.gray,
        "electric" : UIColor.yellow,
        "psychic" : UIColor.purple,
        "figthing" : UIColor.orange,
        "row" : UIColor.darkGray,
        "ground" : UIColor.red,
        "flying" : UIColor(red: 45/255, green: 205/255, blue: 238/255, alpha: 1),
        "bug" :UIColor(red: 109/255, green: 244/255, blue: 45/255, alpha: 1),
        "poison" : UIColor(red: 151/255, green: 45/255, blue: 244/255, alpha: 1),
        "dark" : UIColor.darkGray,
        "ghost" : UIColor.gray,
        "ice" :UIColor(red: 45/255, green: 205/255, blue: 238/255, alpha: 1),
        "steel" : UIColor.gray,
        "dragon" : UIColor(red: 24/255, green: 217/255, blue: 45/255, alpha: 1),
        "fairy" :UIColor(red: 255/255, green: 146/255, blue: 232/255, alpha: 1)
    ]
}
