//
//  ContentView.swift
//  Book of the day
//
//  Created by pbakharuev on 18.11.2023.
//

import SwiftUI

import Foundation


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
