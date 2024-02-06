//
//  ContentView.swift
//  CardWar
//
//  Created by Sumit on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "back"
    @State var cpuCard = "back"
        
    @State var playerScore = 0
    @State var cpuScore = 0
        
    @State var playerCardValue = 3
    @State var cpuCardValue = 2
    
    @State var backgroundImage = "background-cloth"
        
    var body: some View {
        ZStack {
            Image(backgroundImage)
                .resizable()
                .ignoresSafeArea()
                
                
            VStack {
                    
                Image("logo")
                    .padding(.all)
                Spacer()
                    
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                    
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                    
                    
                Spacer()
                Button {
                    reset()
                } label: {
                    Image("resetButton")
                        .scaledToFit()
                        .scaleEffect(0.57)
                }

                Spacer()
                    
                HStack {
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("Computer")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore)).font(.largeTitle)
                        }
                    Spacer()
                    }
                    .foregroundColor(.white)
                    Spacer()
                    
            }
                
                
        }
            
    }
        
    func deal(){
            
        playerCardValue = Int.random(in: 2...14)
        cpuCardValue = Int.random(in: 2...14)
            
        playerCard = "card" + String(playerCardValue)
            
        cpuCard = "card" + String(cpuCardValue)
            
            
            
        if playerCardValue > cpuCardValue {
            playerScore += 1
        }
        else if playerCardValue < cpuCardValue {
            cpuScore += 1
        }
            
        if playerScore < cpuScore {
            backgroundImage = "background-wood-grain"
        }
        else if playerScore > cpuScore {
            backgroundImage = "background-cloth"
        }
    }
    
    func reset(){
        playerCard = "back"
        cpuCard = "back"
           
        playerScore = 0
        cpuScore = 0
        
        backgroundImage = "background-cloth"
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
