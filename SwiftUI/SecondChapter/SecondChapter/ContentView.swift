//
//  ContentView.swift
//  SecondChapter
//
//  Created by Aaron Lee on 8/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Figures").font(.largeTitle).fontWeight(.heavy)
            HStack {
                Text("Ellipses").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height: 10)
                
                HStack {
                    Circle().fill(Color.yellow)
                    Ellipse().fill(Color.green)
                    Capsule().fill(Color.orange)
                    RoundedRectangle(cornerRadius: 30).fill(Color.gray)
                }
            }
            HStack {
                Text("Squares").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height: 10)
                
                HStack {
                    Color.red
                    Rectangle().fill(Color.blue)
                    RoundedRectangle(cornerRadius: 0).fill(Color.purple)
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
