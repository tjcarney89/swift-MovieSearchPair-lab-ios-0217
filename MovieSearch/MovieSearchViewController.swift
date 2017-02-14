//
//  MovieSearchViewController.swift
//  MovieSearch
//
//  Created by James Campagno on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController {
    
    let movieAPI = MovieAPI()
    
    @IBOutlet weak var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    func searchFilm(with title: String) {
        
        print(title)
        
       print(movieAPI.searchFilm(title: title))
        
    }


}

// MARK: - UITextFieldDelegate
extension MovieSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let title = textField.text ?? "No Text"
        searchFilm(with: title)
        textField.resignFirstResponder()
        return true
    }
    
}
