//
//  ViewModel.swift
//  Book of the day
//
//  Created by pbakharuev on 20.11.2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var book: Book = bookList.first!
    @Published var nextBook: Book = bookList[1]
    var i = 0
    let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/mass-market-paperback?api-key=ZtG15qqgQeLGtIn7K6hVb57qY4ombxhx")!
    var showingAlert = false
    var likes = [-1, -2]
    var isLiked = false
    func next(){
        if (self.i + 1 < bookList.endIndex){
            self.i = self.i + 1
            DispatchQueue.main.async {
                self.book = bookList[self.i]
                if (self.likes.contains(self.i)){
                    self.isLiked = true
                } else {
                    self.isLiked = false
                }
            }
        } else {
            self.showingAlert = true
        }
        
    }
    func restart(){
        DispatchQueue.main.async {
            self.i = 0
            self.book = bookList[self.i]
            self.showingAlert = false
        }
        
    }
    func like(){
        if (isLiked) {
            unlike()
        } else {
            self.isLiked.toggle()
            self.likes.append(self.i)
        }
        
    }
    
    func unlike(){
        self.isLiked.toggle()
        self.likes.removeAll(where: { $0 == i } )
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
