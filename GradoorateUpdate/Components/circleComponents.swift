//
//  circleComponents.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 21/08/23.
//

import SwiftUI

struct circleComponents: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.white)
                .frame(width: 96, height: 96)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 3)
                )
            Circle()
                .fill(Color.OrangeTwo)
                .frame(width: 78, height: 78)
        }
    }
}

struct circleComponents_Previews: PreviewProvider {
    static var previews: some View {
        circleComponents()
    }
}
