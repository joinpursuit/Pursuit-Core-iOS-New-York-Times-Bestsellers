# Unit 4 Assignment - New York Times Bestsellers


# Github Instructions
- Create a empty repository on one group member's account. Do not fork the instructions repo (the one you are looking at right now); you won't need any of the assets in here.
- Each member should clone down that repository to their machine.
- Use branches to work on different features of the application at different times. Make sure to check out from the `master` branch (`git pull master` before `git checkout -b my-new-branch`)
- Push changes from your branch and make pull requests when your feature is complete. Be sure to tag someone in your pull request so they can review and merge.


# Overview

Use the **NYTimes Best Sellers Books API** to load a list of best-selling books in a collection view. 

The User Interface should be created 100% programmatically (no storyboards or xibs).

Requirements:
- The user should be able to select different categories to view the best-selling books in that category.  
- Selecting a book should segue to a **Detail View Controller** where the user can see more information about the book and favorite the book.
- Favoriting a book should save it to documents directory.  
- The user should be able to view all the books that they have favorited. 
- The user should be able to delete a favorited book.
- The user should be able to use a **Settings** page to set the default category that will be loaded in the list of recent best-sellers.
- Books added to favorites are sorted by most recently added date. 


# Detailed Outline

Your app should have three (3) tabs

1. Best Sellers
2. Favorites
3. Settings


## Best Sellers

This view should have a:

- `CollectionView`
- `PickerView`

The picker view should list all the available categories (Endpoint 1).  Selecting a row in the picker view should load the appropriate images in the collection view.  If the user has set a default category in the Settings tab, the picker view should spin there.

The collection view cell should include:

- The image of the books cover
- The number of weeks the book has been on the best seller list
- Its description

Selecting a cell should segue to a Detail View Controller with more information including:

- The cover
- A description
- Any other relevant information you want to add as well.

## Best Sellers Detail

This Detailview should have a:

- `UIButton` or `Segmented control`
There should be 4 buttons or 4 segemented control that would take you to a safari view controller to present the book sellers webpage

- `Safari ViewController`
It should show Amazon, apple books, Barnes & Nobles, Local Book Sellers based on one of the 4 buttons selected 

The Detail ViewController should show the Book's image (Large image), a TextView for the description and a label for the book title and a Favorite button.  

- Favorites Button
When a user favorites a book there should be a show alert or animation (It's up to you) anything that shows the user the book  they favrited was added. 

## Favorites

This view should have a:

- Collection View

The collection view should display all of the books that the user has favorited. Favorites should be saved to the documents directory. If there is no books in the Collection View there should be an empty state that displays a message 



## Settings

This view should have a:

- Picker View

The user should use this picker view to set the default category for loading books.  If the default is already set, this picker view should spin to that category.  The default category should be saved using `UserDefaults` and should persist between launches.


## Stretch

- Add a "See on Amazon" Alert Action.
- Add the Amazon launch button in the Books Detail View Controller to view on Amazon.


# APIs

There is one API needed for this app:

- NYT API

**NYT API:** You will need to create an [API key](https://developer.nytimes.com/accounts/login) in order to make requests.

**Endpoint NYT: Best Sellers for a category**

```
https://api.nytimes.com/svc/books/v3/lists/current/business books.json?api-key=\(key)
```


## Sample UI

![nyt bestsellers app gif](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/nyt-bestsellers-app.gif)

| Bestsellers | Favorites | Settings | Detail View |
|:-----:|:-------:|:-------:|:-------|
|![screen 1](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-1.png) | ![screen 2](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-2.png) |![screen 3](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-3.png)|![screen 4](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-4.png)|
