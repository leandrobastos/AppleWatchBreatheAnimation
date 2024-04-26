//
//  ContentView.swift
//  AppleWatchBreatheAnimation
//
//  Created by Leandro Bastos on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating = false

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    BreatheView(multiplier: isAnimating ? 1 : 0)
                }
                .scaleEffect(isAnimating ? 1 : 0.5)
                .rotationEffect(.degrees(isAnimating ? 180 : 0))
                .frame(width: 200, height: 200, alignment: .center)
                Spacer()
            }
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 2)
                        .repeatForever(autoreverses: true)) {
                    isAnimating.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
