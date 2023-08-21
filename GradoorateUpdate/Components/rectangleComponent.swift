//
//  rectangleComponent.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 16/08/23.
//

import SwiftUI

struct rectangleComponent: View {
    var body: some View {
        ZStack{
            CustomShape(cornerRadius: 10)
                .fill(Color.OrangeOne)
                .frame(width: 370, height: 180)
                .overlay(
                    CustomShape(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3)
                )
                .padding(8)
        }
    }
}

//MARK: Func Segitiga
struct CustomShape: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        let endPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let controlPoint = CGPoint(x: rect.minX, y: rect.maxY)
        
        path.move(to: CGPoint(x: 170, y: 13))
        //        path.move(to: controlPoint)
        path.addArc(tangent1End: startPoint, tangent2End: endPoint, radius: cornerRadius)
        path.addArc(tangent1End: endPoint, tangent2End: controlPoint, radius: cornerRadius)
        path.addArc(tangent1End: controlPoint, tangent2End: startPoint, radius: cornerRadius)
        
        path.closeSubpath()
        
        return path
    }
}

struct rectangleComponent_Previews: PreviewProvider {
    static var previews: some View {
        rectangleComponent()
    }
}
