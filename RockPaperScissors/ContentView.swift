//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sara Nicole Mikac on 2/16/20.
//  Copyright © 2020 Erik Mikac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var rps = ["rock", "paper", "scissors"]
    @State private var cpuCurrentChoice = 0
    @State private var usrShouldWin = true
    @State private var userSelection = 0
    @State private var score = 0
    @State private var isDraw = false
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<rps.count, id: \.self) { number in
                        Button(action:
                        {self.btnTapped(number: number)}) {
                            Text("\(self.rps[number])")
                        }
                    }.foregroundColor(.red).padding()
            }
            VStack {
                Text("Your Choice: \(self.rps[userSelection])")
                Text("CPU Choice: \(self.rps[cpuCurrentChoice])")
                Text(isDraw ? "Draw!" : usrShouldWin ? "You Win" : "You Lose")
                Text("Score: \(score)")
            }
        }
    }
    func btnTapped(number: Int) {
        self.isDraw = false
        cpuCurrentChoice = Int.random(in: 0..<rps.count)
        userSelection = number
        if(userSelection == 0 && cpuCurrentChoice == 1) {
            // User picked rock, CPU picked paper
            self.usrShouldWin = false;
            score -= 1
        } else if(userSelection == 1 && cpuCurrentChoice == 0) {
            self.usrShouldWin = true
            score += 1
        } else if(userSelection == 0 && cpuCurrentChoice == 2) {
            self.usrShouldWin = true
        } else if(userSelection == 2 && cpuCurrentChoice == 0) {
            self.usrShouldWin = false
            score -= 1
        } else if(userSelection == 1 && cpuCurrentChoice == 2) {
            self.usrShouldWin = false
            score -= 1
        } else if(userSelection == 2 && cpuCurrentChoice == 1) {
            self.usrShouldWin = true
            score += 1
        } else {
            self.usrShouldWin = false
            self.isDraw = true
            
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
