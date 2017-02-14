//
//  MovieAPI.swift
//  MovieSearch
//
//  Created by James Campagno on 2/13/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MovieAPI {
 
    func searchFilm(title: String) -> [String : Any]? {
        return retrieveJSON(with: title)
    }
    
    // MARK: - Private Functions
    
    private func retrieveJSON(with title: String) -> [String : Any]? {
        guard let path = Bundle.main.url(forResource: resource(for: title), withExtension: "json")
            else { print("bad path"); return nil }
        guard let jsonData = try? Data(contentsOf: path, options: .mappedIfSafe)
            else { print("bad jsonData"); return nil }
        guard let jsonResult = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String : Any]
            else { print("bad jsonResult"); return nil }
        return jsonResult
    }
    
    private func resource(for title: String) -> String {
        switch title {
        case "Toy Story", "toy story", "Toy story": return "toystory"
        case "Fargo", "fargo": return "fargo"
        case "Titanic", "titanic": return "titanic"
        default: return ""
        }
    }

}

