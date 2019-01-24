# Unit 4 Assignment - New York Times Bestsellers

![nyt bestsellers app gif](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/nyt-bestsellers-app.gif)

# Github Instructions
- Fork this repository.
- Clone it to your machine
- Complete the sections below
- Add, commit and push your changes
- Create a pull request from your fork back to the original repo here
- Paste the link of your fork into Canvas

# Overview

Use the NYTimes Best Sellers Books API to load a list of best selling books in a collection view. Layout should be done 100% using programmatic ui. 

- The user should be able to select different categories to view its best selling books.  
- Selecting a book should segue to a detail view controller where the user can see more information about the book and favorite the book.  
- Favoriting a book should save it to documents directory.  
- The user should be able to view all the books that they have favorited. 
- The user should be able to delete a favorited book. 
- The user should be able to use a Settings page to set the default category that will be loaded in the list of recent best sellers.
- Books added to favorites are sorted by most recently added date. 


# Detailed Outline

Your app should have (3) tabs

1. Best Sellers
2. Favorites
3. Settings

## Best Sellers

This view should have a:

- Collection View
- Picker View

The picker view should list all the available categories (Endpoint 1).  Selecting a row in the picker view should load the appropriate images in the collection view.  If the user has set a default category in the Settings tab, the picker view should spin there.

The collection view cell should include:

- The image of the books cover
- The number of weeks it has been on the best seller list
- It's description

Selecting a cell should segue to a Detail View Controller with more information including:

- The cover
- A description
- Any other relevant information you want to add as well.

## Favorites

This view should have a:

- Collection View

The collection view should display all of the books that the user has favorited. Favorites should be saved to the documents directory.

## Settings

This view should have a:

- Picker View

The user should use this picker view to set the default category for loading books.  If there is already a default set, this picker view should spin to that category.  The default category should be saved using UserDefaults and should persist between launches.


# Endpoints

There are two endpoints for this app:

- NYT API
- Google Books API

You will need to create an [API key](https://developer.nytimes.com/accounts/login) for the NYT API in order to make requests.

You will need to create an [API Key](https://developers.google.com/books/docs/v1/using#APIKey) for the Google API in order to not get rate limited.  You do **not** need to use OAuth.  Follow the instructions in the "Other" section.

**Endpoint 1: Categories**

```
https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)
```

**Endpoint 2: Best Sellers for a category**

```
https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(key)&list=\(hyphen-separated-list-name)
(e.g Hardcover-Fiction)
```

**Endpoint 3: Google Books isbn**

```
https://www.googleapis.com/books/v1/volumes?q=+isbn:0385514239
```

| Bestsellers | Favorites | Settings | Detail View |
|:-----:|:-------:|:-------:|:-------|
|![screen 1](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-1.png) | ![screen 2](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-2.png) |![screen 3](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-3.png)|![screen 4](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-4.png)|


# Rubric

|Criterion|Points|
|---|---|
| App correctly uses Programmable UI Layout for all portrait iPhones | 4 |
| Variable Naming and Readability | 4 |
| App follows best practices in MVC and organization | 4 |
| Loads books into a collection view based on the picker view | 4 |
| Collection view cell is correctly configured including the cover image if available| 4 |
| Selecting a cell from the Best Sellers tab or Favorites tab segues to a detail view controller with more information | 4 |
| Favoriting a book saves it to the Documents Directory and persists between launches | 4 |
| Deleting a book removes it from the Documents Directory | 4 |
| Favorited books load appropriately in the Favorites tab | 4 |
| Selecting a categoy in the Settings tab saves it using UserDefaults | 4 |
| Picker views in the Settings tab and Best Sellers tab spin appropriately to the saved category (if available) | 4 |
| Sort favorite books by recently added date | 4 |

Total Points 48 

# Bonus

- Add the "See on Amazon" Alert Action
- Add the Amazon launch button in the Books Detail View Controller

Bonus Points 10 
