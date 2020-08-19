//
//  ContentView.swift
//  HellowSwiftUI
//
//  Created by Aaron Lee on 8/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .font(.largeTitle)
            .foregroundColor(.orange)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
