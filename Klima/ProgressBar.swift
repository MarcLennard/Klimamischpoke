//
//  ProgressBar.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

enum ProgressBarSize {
    case small
    case medium
    
    var outerWidthAndHeight: CGFloat {
        switch self {
        case .small:
            return 80
        case .medium:
            return 215
        }
    }
    
    var innerWidthAndHeight: CGFloat {
        switch self {
        case .small:
            return 57
        case .medium:
            return 150
        }
    }
    
    var thickness: CGFloat {
        switch self {
        case .small:
            return 10
        case .medium:
            return 30
        }
    }
}

struct ProgressBar: View {
    @Binding var co2Progress: Double
    @Binding var pointProgress: Double
    
    var size: ProgressBarSize = .medium
    
    var body: some View {
        ZStack {
            RingView(
                currentPercentage: $co2Progress,
                backgroundColor: Color.gray.opacity(0.5),
                startColor: Color.green.opacity(0.3),
                endColor: Color.green,
                thickness: size.thickness
            )
            .frame(width: size.innerWidthAndHeight, height: size.innerWidthAndHeight)
                .aspectRatio(contentMode: .fit)
            RingView(
                currentPercentage: $pointProgress,
                backgroundColor: Color.gray.opacity(0.5),
                startColor: Color.orange.opacity(0.3),
                endColor: Color.orange,
                thickness: size.thickness
            )
            .frame(width: size.outerWidthAndHeight, height: size.outerWidthAndHeight)
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct RingView: View {
    
//    @State var currentPercentage: Double = 0.5
    @Binding var currentPercentage: Double
    
    var backgroundColor: Color
    var startColor: Color
    var endColor: Color
    var thickness: CGFloat

    var animation: Animation {
        Animation.easeInOut(duration: 1)
    }
    
    var body: some View {
        let gradient = AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360 * currentPercentage))
        return ZStack {
            RingBackgroundShape(thickness: thickness)
                .fill(backgroundColor)
            RingShape(currentPercentage: currentPercentage, thickness: thickness)
                .fill(gradient)
                .rotationEffect(.init(degrees: -90))
                .shadow(radius: 2)
                .drawingGroup()
            RingTipShape(currentPercentage: currentPercentage, thickness: thickness)
                .fill(currentPercentage > 1 ? endColor : .clear)
                .rotationEffect(.init(degrees: -90))
        }
    }
    
}

struct RingShape: Shape {
    
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addArc(
            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
            radius: rect.width / 2 - thickness,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 360 * currentPercentage),
            clockwise: false
        )
        
        return path
            .strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
    
}

struct RingTipShape: Shape {
    
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let angle = CGFloat((360 * currentPercentage) * .pi / 180)
        let controlRadius: CGFloat = rect.width / 2 - thickness
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let x = center.x + controlRadius * cos(angle)
        let y = center.y + controlRadius * sin(angle)
        let pointCenter = CGPoint(x: x, y: y)
        
        path.addEllipse(in:
            CGRect(
                x: pointCenter.x - thickness / 2,
                y: pointCenter.y - thickness / 2,
                width: thickness,
                height: thickness
            )
        )
        
        return path
    }
    
    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
    
}

struct RingBackgroundShape: Shape {
    
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
            radius: rect.width / 2 - thickness,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 360),
            clockwise: false
        )
        
        return path
            .strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(co2Progress: .constant(1.5), pointProgress: .constant(0.64))
            .previewLayout(.fixed(width: 300, height: 300))
        
        ProgressBar(co2Progress: .constant(1.5), pointProgress: .constant(0.64), size: .small)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
