//
//  OverLay.swift
//  SecondChapterFigures
//
//  Created by Aaron Lee on 8/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import SwiftUI

struct OverLay: View {
    var body: some View {
        Circle()
            .fill(Color.yellow.opacity(0.9))
            .frame(width: 250, height: 250)
            .overlay(Text("Joystic")).font(.largeTitle)
            .overlay(Image(systemName: "arrow.up").font(.title).padding(), alignment: .top)
            .overlay(Image(systemName: "arrow.left").font(.title).padding(), alignment: .leading)
            .overlay(Image(systemName: "arrow.up.right.circle.fill").font(.title).padding(), alignment: .topTrailing)
            .background(Image(systemName: "arrow.down").font(.title).padding(), alignment: .bottom)
            .background(Image(systemName: "arrow.right").font(.title).padding(), alignment: .trailing)
        
    }
}

struct OverLay_Previews: PreviewProvider {
    static var previews: some View {
        OverLay()
    }
}
