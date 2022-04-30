//
//  Poke+String.swift
//  ProjectMVVM
//
//  Created by Juan Renato on 25/04/22.
//

import Foundation

class HelperString {
    
    static func getIdFromUrl(url: String) -> String {
        return url.components(separatedBy: "/").filter({$0 != ""}).last!
    }
    
    static func getURLFromString(url: String) -> URL? {
        guard let url = URL(string: url) else {return nil}
        return url 
    }
}

