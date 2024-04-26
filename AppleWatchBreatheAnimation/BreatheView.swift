//
//  BreatheView.swift
//  AppleWatchBreatheAnimation
//
//  Created by Leandro Bastos on 12/09/22.
//

import SwiftUI

struct BreatheView: View, Animatable {
    var degress: [Double] = [0, 45, 90, 135, 180, 225, 270, 315].map { $0 * .pi / 180 }

    var multiplier = 0.0

    var animatableData: Double {
        get { multiplier }
        set { multiplier = newValue }
    }

    var body: some View {
        Canvas { context, size in
            for degree in degress {
                var path = Path()

                path.move(to: .zero)

                let circleRadius = size.width / 4
                let x = cos(degree) * circleRadius
                let y = sin(degree) * circleRadius

                let origin = CGPoint(x: x * multiplier, y: y * multiplier)
                let size = CGSize(width: circleRadius * 2, height: circleRadius * 2)
                let rect = CGRect(origin: origin, size: size)
                    .offsetBy(dx: circleRadius, dy: circleRadius)
                path.addEllipse(in: rect)

                context.fill(path, with: .color(.blue.opacity(0.5)))
            }
        }
    }
}

struct BreatheView_Previews: PreviewProvider {
    static var previews: some View {
        BreatheView()
    }
}
