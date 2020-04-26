//
//  ContentView.swift
//  Project6Animations
//
//  Created by Eugene Berezin on 4/25/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dramAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dramAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
                
            }
        }
    .gesture(
        DragGesture()
            .onChanged { self.dramAmount = $0.translation}
            .onEnded {_ in
                self.dramAmount = .zero
                self.enabled.toggle()
        }
        
        
        )
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
