//
//  OnBoardingView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 14/08/23.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        TabView{
            boardingOne()
            VStack{
                VStack(alignment: .leading, spacing: -6){
                    Text("Make 'your project")
                    Text("has been completed'")
                    Text("as your ultimate goal!")
                }
                .frame(width: 324, height: 115, alignment: .leading)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                VStack (spacing: 48){
                    ZStack(alignment: .bottomLeading){
                        Image("onboarding_img2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 490, alignment: .top)
                        Text("Hello there,\nfinal year college students!\n\nIn this space, we’ll help you to build\nlittle habits such as commit to deadline\nand writing logs while completing your\nfinal research project to be more fun!")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .padding(.leading, 32)
                    }
                    NavigationLink {
                        DeadlineView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Ready")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .padding(.vertical, 18)
                            .foregroundColor(.black)
                            .frame(width: 324)
                            .background(
                                Capsule()
                                    .fill(Color.YellowThree)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                            )
                    }
                }
                Spacer()
            }
        }
        .background(Color("offWhite"))
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct boardingOne: View{
    
    var body: some View{
        VStack{
            VStack(alignment: .leading, spacing: -6){
                Text("Do it now")
                Text("take control of your")
                Text("final research project")
            }
            .frame(width: 324, height: 115, alignment: .leading)
            .font(.system(size: 32, weight: .bold, design: .rounded))
            Image("onboarding_img")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
