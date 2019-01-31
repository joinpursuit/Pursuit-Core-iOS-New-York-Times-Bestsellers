//
//  NewBook.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct NewBook {
  let authorName: String
  let description:String
  let bookName: String
  let bookCover: UIImage? // not a property list
  let imageData: Data?
}

// Dependency Injection
//DetailViewController(newBook: NewBook, image: UIImage?) {
//  self.newBook = newBook
//  self.imageView.image = image
//}
