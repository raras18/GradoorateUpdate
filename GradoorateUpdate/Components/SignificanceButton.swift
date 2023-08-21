//
//  SignificanceButton.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 19/08/23.
//

import SwiftUI

struct SignificanceButton: View {
    @State var color: Color
    @State var text: String
    @Binding var isSelected: Bool

    var body: some View {
        VStack{
            ZStack{
                Capsule()
                    .frame(width: 120, height: 40)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(isSelected ? color : .white)
                Text(text)
                    .foregroundColor(.black)
            }
            .overlay(
                Capsule()
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 120, height: 40))
        }
    }
}

struct SignificanceButton_Previews: PreviewProvider {
    static var previews: some View {
        SignificanceButton(color: .white, text: "Option", isSelected: .constant(false))
    }
}
