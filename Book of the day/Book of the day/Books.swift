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
    let image: Stringмшыы
    let amazonURL: String
    let eUrl : String
    let isLiked: Bool
}

struct BookResponse: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let lastModified: String
    let results: BookResult
}

struct BookResult: Codable {
    let listName: String
    let listNameEncoded: String
    let bestsellersDate: String
    let publishedDate: String
    let publishedDateDescription: String
    let nextPublishedDate: String?
    let previousPublishedDate: String
    let displayName: String
    let normalListEndsAt: Int
    let updated: String
    let books: [BookDetails]
}

struct BookDetails: Codable {
    let description: String
    let price: String
    let title: String
    let author: String
    let bookImage: String
    let amazonProductURL: String
    let isbns: [ISBN]
    let buyLinks: [BuyLink]
    let bookURI: String
}

struct ISBN: Codable {
    let isbn10: String
    let isbn13: String
}

struct BuyLink: Codable {
    let name: String
    let url: String
}


// Mock-up data
var bookList: [Book] = [
    Book(
        title: "SWEET TOMORROWS",
        description: "The journeys of the characters at the Rose Harbor Inn come to a close in this last book of the series.",
        author: "Debbie Macomber",
        image: "https://storage.googleapis.com/du-prd/books/images/9780553391848.jpg",
        amazonURL: "https://www.ozon.ru/product/sweet-tomorrows-1265193626/",
        eUrl: "https://books.google.ru/books?id=MijjCgAAQBAJ&hl=ru",
        isLiked: false
    ),
    Book(
        title: "THE MURDER HOUSE",
        description: "When bodies are found at a Hamptons estate where a series of grisly murders once occurred, a local detective and former New York City cop investigates.",
        author: "J.Patterson, D. Ellis",
        image: "https://storage.googleapis.com/du-prd/books/images/9780316337977.jpg",
        amazonURL: "http://www.amazon.com/The-Murder-House-James-Patterson-ebook/dp/B00QQQL8JY?tag=NYTBSREV-20",
        eUrl: "https://books.google.ru/books?id=MijjCgAAQBAJ&hl=ru",
        isLiked: false
    ),
    Book(
        title: "A DOG'S PURPOSE",
        description: "From stray mutt to golden-haired puppy, a dog finds himself reincarnated over the years as he searches for his purpose in life.",
        author: "W Bruce Cameron",
        image: "https://storage.googleapis.com/du-prd/books/images/9780765330345.jpg",
        amazonURL: "https://www.amazon.com/Dogs-Purpose-Novel-Humans/dp/0765330342?tag=NYTBSREV-20",
        eUrl: "https://books.google.ru/books?id=MijjCgAAQBAJ&hl=ru",
        isLiked: false
    ),
    Book(
        title: "MULBERRY MOON",
        description: "Ben Sterling returns home to Mystic Creek to settle down and start a family, but the woman of his interest is more than a little resistant. As she warms to him, her past comes back to interfere.",
        author: "Catherine Anderson",
        image: "https://storage.googleapis.com/du-prd/books/images/9780451488022.jpg",
        amazonURL: "https://www.amazon.com/Mulberry-Mystic-Creek-Catherine-Anderson/dp/0451488024?tag=NYTBSREV-20",
        eUrl: "https://books.google.ru/books?id=MijjCgAAQBAJ&hl=ru",
        isLiked: false
    ),
    Book(
        title: "CRASH AND BURN",
        description: "The Sisterhood steps up when the legal client of a member is threatened by ruthless politics and ambition in Washington.",
        author: "Fern Michaels",
        image: "https://storage.googleapis.com/du-prd/books/images/9781420140651.jpg",
        amazonURL: "https://www.amazon.com/Crash-Burn-Sisterhood-Fern-Michaels/dp/1420140655?tag=NYTBSREV-20",
        eUrl: "https://books.google.ru/books?id=MijjCgAAQBAJ&hl=ru",
        isLiked: false
    )
]

// Now you can use this mock data for testing or displaying in your app.
