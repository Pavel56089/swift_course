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

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var showingAlert : Bool = false
    @State var isLiked: Bool = false
    var body: some View {
        VStack{
            Text("Book of the day by NYT")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding()
            Image("img_" + String(viewModel.i))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 400)
            HStack{
                Link("Buy paper", destination: URL(string: viewModel.book.amazonURL)!)
                Text("|")
                Link("Buy e-book", destination: URL(string: viewModel.book.amazonURL)!)
                Text("|")
                ShareLink(item: URL(string: viewModel.book.eUrl)!)
            }
            HStack{
                VStack{
                    Text(viewModel.book.title ).font(.system(size: 20))
                        .frame(width: 300)
                        .padding(1)
                        .lineLimit(2)
                    Text(" by " + viewModel.book.author).font(.system(size: 20))
                        .padding(1)
                        .lineLimit(1)
                }
                .frame(width: 250)
                Button (action:{
                    viewModel.likes.append(viewModel.i)
                    print(viewModel.likes)
                    print(viewModel.i)
                    viewModel.like()
                    print(viewModel.isLiked)
                    isLiked.toggle()
                }, label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .foregroundColor(isLiked ? .red : .gray)
                })
                
                
            }
            
            Text(viewModel.book.description).font(.system(size: 15, design: .default)).frame(width: 350, height: 90)
                .padding(1)
            Button{
                viewModel.next()
                showingAlert = viewModel.showingAlert
                if (viewModel.likes.contains((viewModel.i + 1) % (viewModel.likes.endIndex + 1))){
                    isLiked = true
                    print("след лайк")
                } else {
                    isLiked = false
                }
                
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
        .alert(isPresented: $showingAlert){
            Alert(title: Text("Last book"), message: Text("This is the last book for today"), primaryButton: .destructive(Text("Go to first")){ viewModel.restart()}, secondaryButton: .cancel())
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
