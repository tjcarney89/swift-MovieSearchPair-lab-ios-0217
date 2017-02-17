//
//  MovieSearchViewController.swift
//  MovieSearch
//
//  Created by James Campagno on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let movieAPI = MovieAPI()
    var searchResultsDict: [String : Any] = [:]
    var movieResults: [Movie] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    func searchFilm(with title: String) {
        movieResults.removeAll()
        guard let searchResultsDict = movieAPI.searchFilm(title: title) else { return }
        let movieResultsArray = searchResultsDict["Search"]
        for myMovie in movieResultsArray as! [[String : Any]] {
            movieResults.append(Movie(myMovie))
        }
        print("MOVIE RESULTS: \(movieResults)")
        //print(temp)
        //print (temp.count)
        
        movieTableView.reloadData()

        
        
//        tableView(tableView(self.tableView, cellForRowAt: <#T##IndexPath#>))
        
        print(title)
        
       //print(movieAPI.searchFilm(title: title))
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieSearchCell
        let currentMovie = movieResults[indexPath.row]
        cell.titleLabel.text = currentMovie.title
        cell.yearLabel.text = "Year: \(currentMovie.year)"
        cell.idLabel.text = "IMDB ID: \(currentMovie.id)"
        if currentMovie.link != "N/A" {
            if let url = NSURL(string: currentMovie.link) {
                if let data = NSData(contentsOf: url as URL) {
                    cell.urlImage.image = UIImage(data: data as Data)
                }
            }
        } else {
            cell.urlImage.image = nil 
        }

        
        
        
        return cell
    }
}




/*Create a separate Movie type that has an init function which takes in a Dictionary of type [String : Any] which its able to parse through to setup its various stored properties.
Create a UITableView in the MovieSearchViewController (you can use Storyboard and are encouraged to do so).
Set up this UITableView to display all of the necessary info of all of the Movie objects you were able to create as a result of the search done by the user.*/



// MARK: - UITextFieldDelegate
extension MovieSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let title = textField.text ?? "No Text"
        searchFilm(with: title)
        textField.resignFirstResponder()
        return true
    }
    
}
