# Unit 4 Assignment - New York Times Bestsellers

# Github Instructions
- Create a empty repository on one group member's account. Do not fork this repo: You won't need any of the assets in here.
- Clone down your repository to each member's machine.
- Use branches to work on different features of the application at different times. Make sure to check out from the current `master` branch (`git pull master` before `git checkout -b my-new-branch`
- Push changes and make pull requests when your feature is complete. Be sure to tag someone in your pull request so they can review.


# Overview

Use the **NYTimes Best Sellers Books API** to load a list of best-selling books in a collection view. 

The User Interface should be created 100% programmatically (no storyboards).

Requirements:
- The user should be able to select different categories to view the best-selling books in that category.  
- Selecting a book should segue to a **Detail View Controller** where the user can see more information about the book and favorite the book.
- Favoriting a book should save it to documents directory.  
- The user should be able to view all the books that they have favorited. 
- The user should be able to delete a favorited book.
- The user should be able to use a **Settings** page to set the default category that will be loaded in the list of recent best sellers.
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


# APIs

There are two APIs for this app:

- NYT API
- Google Books API

**NYT API:** You will need to create an [API key](https://developer.nytimes.com/accounts/login) in order to make requests.

**Google Books API:** You will need to create an [API Key](https://developers.google.com/books/docs/v1/using#APIKey) in order to not get [rate limited](https://www.keycdn.com/support/rate-limiting). Follow the instructions for getting **API Keys**. You do **not** need to use OAuth.


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

![nyt bestsellers app gif](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/nyt-bestsellers-app.gif)

| Bestsellers | Favorites | Settings | Detail View |
|:-----:|:-------:|:-------:|:-------|
|![screen 1](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-1.png) | ![screen 2](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-2.png) |![screen 3](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-3.png)|![screen 4](https://github.com/joinpursuit/Pursuit-Core-iOS-New-York-Times-Bestsellers/blob/master/Images/screen-shot-4.png)|

# Stretch

- Add a "See on Amazon" Alert Action.
- Add the Amazon launch button in the Books Detail View Controller to view on Amazon.
