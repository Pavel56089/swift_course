//
//  SplashScreenView.swift
//  Book of the day
//
//  Created by pbakharuev on 20.11.2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack{
                VStack{
                    Image(systemName: "book")
                        .font(.system(size: 80))
                        .foregroundColor(.orange)
                    Text("Book of the day")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .padding(1)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear(){
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        self.isActive = true
                    }
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
