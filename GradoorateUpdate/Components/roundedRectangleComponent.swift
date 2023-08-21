//
//  roundedRectangleComponent.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 16/08/23.
//

import SwiftUI

struct roundedRectangleComponent: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.YellowThree)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 2)
                )
        }
    }
}

struct roundedRectangleComponent_Previews: PreviewProvider {
    static var previews: some View {
        roundedRectangleComponent()
    }
}
