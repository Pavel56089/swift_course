//
//  ContentView.swift
//  Book of the day
//
//  Created by pbakharuev on 18.11.2023.
//

import SwiftUI

import Foundation

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


class ViewModel: ObservableObject {
    @Published var book: Book = bookList.first!
    var i = 1
    let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/mass-market-paperback?api-key=ZtG15qqgQeLGtIn7K6hVb57qY4ombxhx")!
    
    func next(){
        DispatchQueue.main.async {
            if (self.i < 3){
                self.book = bookList[self.i]
                self.i = self.i + 1
            }
        }
    }
    func fetch(){
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
//          print(String(data: data, encoding: .utf8)!)
            do {
                let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
                // Now you can access the data like bookResponse.results.listName, bookResponse.results.books, etc.
                print(bookResponse.results)
                guard let firstBook = bookResponse.results.books.first else {
                            print("No books found in the response")
                            return
                        }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        

        task.resume()
        
        return
    }

}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            Text("Book of the day by NYT")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding()
            Image("sweet_tommorovs")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 450)
            Link("Buy now", destination: URL(string: viewModel.book.amazonURL)!)
            Text(viewModel.book.title + " by " + viewModel.book.author).font(.system(size: 20))
                .frame(width: 300)
                .padding(1)
            Text(viewModel.book.description).font(.system(size: 15, design: .default)).frame(width: 350, height: 50)
                .padding()
            Button{
                viewModel.next()
                print("btn clicked")
            } label: {
                Text("Next")
                    .frame(width: 200, height: 40)
                    .background(Color.blue)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
//        .task {
//            do{
//                print("hello")
//            } catch {
//
//            }
        }
    }
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
