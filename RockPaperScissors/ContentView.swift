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
    @State private var usrShouldWin = Bool.random()
    @State private var userSelection = ""
    var body: some View {
        Button(action:
            {self.btnTapped()}) {
                Text("Cpu chose: \(rps[self.cpuCurrentChoice])")
        }
    }
    
    func btnTapped() {
        cpuCurrentChoice = Int.random(in: 0..<rps.count)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
