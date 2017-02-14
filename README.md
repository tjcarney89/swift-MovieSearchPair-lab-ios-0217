# Movie Search

The user will be able to search for film titles in the `UITextField` located in the navigation bar.

![](http://i.imgur.com/VYF00Vh.png)

For this lab, the user will only be allowed to search for three films. Those films being "Toy Story", "Fargo", and "Titanic".

If the user had searched for the film "Titanic", you would get back a `JSON` response in the form of a `Dictionary` in Swift of type [`String` : `Any`]. You can see what this response looks like below. Note that this response takes this same form if you were searching for either "Toy Story" or "Fargo". The difference being the data to be displayed. The keys in the `Dictionary` below would remain the same throughout any search.

Navigate to the `MovieSearchViewController.swift` file. You should see the following function:

```swift
    func searchFilm(with title: String) {
        
        print(title)
        
    }
```

This is the function which gets called anytime a user searches for something and hits the return key on their keyboard. Through the `title` argument of the function, we have access to the `String` value the user had typed into the text field.

Navigate now to the `MovieAPI.swift` file. You should find the following function:

```swift
    func searchFilm(title: String) -> [String : Any]? {
        return retrieveJSON(with: title)
    }
```

This function takes in one argument labeled as `title` of type `String`. It will call on another function (which you don't have to worry about for this lab). Ultimately, it will return back a `Dictionary` of type [`String` : `Any`]? This will be very useful to us. Any instance of this `MovieAPI` type will be able to search for films and ultimately give us back a dictionary that will represent multiple films under that title.

Navigate back to the `MovieSearchViewController.swift` file. You should see the following stored property:

```swift
    let movieAPI = MovieAPI()
```

Within the scope of our `MovieSearchViewController` type, we have access to an instance of `MovieAPI` called `movieAPI` which we can utilize.

**ALL TOGETHER NOW**:

* Create a separate `Movie` type that has an `init` function which takes in a `Dictionary` of type [`String` : `Any`] which its able to parse through to setup its various stored properties.
* Create a `UITableView` in the `MovieSearchViewController` (you can use Storyboard and are encouraged to do so).
* Set up this `UITableView` to display all of the necessary info of all of the `Movie` objects you were able to create as a result of the search done by the user.






### JSON Response:

```
{"Search":[{"Title":"Titanic","Year":"1997","imdbID":"tt0120338","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg"},{"Title":"Titanic II","Year":"2010","imdbID":"tt1640571","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxMjQ1MjA5Ml5BMl5BanBnXkFtZTcwNjIzNjg1Mw@@._V1_SX300.jpg"},{"Title":"Titanic: The Legend Goes On...","Year":"2000","imdbID":"tt0330994","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5MjcxODAwMV5BMl5BanBnXkFtZTcwMTk4OTMwMg@@._V1_SX300.jpg"},{"Title":"Titanic","Year":"1953","imdbID":"tt0046435","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTU3NTUyMTc3Nl5BMl5BanBnXkFtZTgwOTA2MDE3MTE@._V1_SX300.jpg"},{"Title":"Titanic","Year":"1996","imdbID":"tt0115392","Type":"series","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTIyNjc0NjgyMl5BMl5BanBnXkFtZTcwMDAzMTAzMQ@@._V1_SX300.jpg"},{"Title":"Raise the Titanic","Year":"1980","imdbID":"tt0081400","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTY5MTQwNzMxNV5BMl5BanBnXkFtZTcwMzkwOTMyMQ@@._V1_SX300.jpg"},{"Title":"The Legend of the Titanic","Year":"1999","imdbID":"tt1623780","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMjMxNDU5MTk1MV5BMl5BanBnXkFtZTgwMDk5NDUyMTE@._V1_SX300.jpg"},{"Title":"Titanic","Year":"2012","imdbID":"tt1869152","Type":"series","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTcxNzYxOTAwMF5BMl5BanBnXkFtZTcwNzU3Mjc2Nw@@._V1_SX300.jpg"},{"Title":"Titanic: Blood and Steel","Year":"2012–","imdbID":"tt1695366","Type":"series","Poster":"N/A"},{"Title":"The Chambermaid on the Titanic","Year":"1997","imdbID":"tt0129923","Type":"movie","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMWUzYjgyNDEtNTAyMi00M2JjLTlhMzMtMDJmOGM1ZmYzNzY4XkEyXkFqcGdeQXVyMTA0MjU0Ng@@._V1_SX300.jpg"}],"totalResults":"184","Response":"True"}
```