//
//  ProgressCircleView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 20/08/23.
//

import SwiftUI

struct ProgressCircleView: View {
    var progress: Double {
        let totalItems = 3
        let currentItemCount = 2
        return Double(currentItemCount) / Double(totalItems)
    }
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(Color.OrangeOne, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 88, height: 88)
            Circle()
                .stroke(.black, lineWidth: 2)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
            ZStack{
                Circle()
                    .fill(Color.GrayOne)
                    .frame(width: 80, height: 80)
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 20, height: 30)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView()
    }
}
