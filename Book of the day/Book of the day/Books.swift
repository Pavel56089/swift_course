//
//  Books.swift
//  Book of the day
//
//  Created by pbakharuev on 19.11.2023.
//

import Foundation
struct Book {
    let title: String
    let description: String
    let author: String
    let image: String
    let amazonURL: String
}

// Mock-up data
let bookList: [Book] = [
    Book(
        title: "SWEET TOMORROWS",
        description: "The journeys of the characters at the Rose Harbor Inn come to a close in this last book of the series.",
        author: "Debbie Macomber",
        image: "https://storage.googleapis.com/du-prd/books/images/9780553391848.jpg",
        amazonURL: "https://www.ozon.ru/product/sweet-tomorrows-1265193626/"
    ),
    Book(
        title: "THE MURDER HOUSE",
        description: "When bodies are found at a Hamptons estate where a series of grisly murders once occurred, a local detective and former New York City cop investigates.",
        author: "James Patterson and David Ellis",
        image: "https://storage.googleapis.com/du-prd/books/images/9780316337977.jpg",
        amazonURL: "http://www.amazon.com/The-Murder-House-James-Patterson-ebook/dp/B00QQQL8JY?tag=NYTBSREV-20"
    ),
    // Add more books as needed
]

// Now you can use this mock data for testing or displaying in your app.
