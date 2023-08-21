//
//  TextFieldComponent.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 21/08/23.
//

import SwiftUI

struct TextFieldComponent: View {
    @Binding var textLog: String
    @State var title: String
    @State var textEmpty: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.leading)
            
            ZStack (alignment: .bottomTrailing){
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 350, height: 140, alignment: .topLeading)
                        .foregroundColor(.white)
                        .padding(.bottom, 23)
                    TextEditor(text: $textLog)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .frame(width:320, height: 125, alignment: .leading)
                        .padding([.horizontal, .bottom], 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.black, lineWidth: 2)
                                .frame(width: 350, height: 140, alignment: .topLeading)
                                .padding([.horizontal, .bottom], 25)
                                .padding(.leading, 2)
                        )
                        .disableAutocorrection(true)
                        .onChange(of: textLog) { newValue in if newValue.count > 100 { textLog = String(newValue.prefix(100))
                        }
                        }
                    if textLog.isEmpty{
                        Text(textEmpty)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(.gray.opacity(0.7))
                            .frame(width: 310, height: 130, alignment: .topLeading)
                    }
                }
                Text("\(textLog.count)/100")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.gray.opacity(0.7))
                    .padding(.trailing, 20)
                    .padding(.bottom, 35)
            }
        }
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponent(textLog: .constant(""), title: "Title", textEmpty: "Empty")
    }
}
