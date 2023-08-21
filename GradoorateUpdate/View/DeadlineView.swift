//
//  DeadlineView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 14/08/23.
//

import SwiftUI

struct DeadlineView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var vm = ViewModel()
    @State private var isButtonDisabled = true
    var body: some View {
        ZStack{
            Color("offWhite")
            
            VStack(spacing: 80){
                Spacer()
                VStack(spacing:48){
                    
                    //MARK: Heading
                    VStack(spacing: 16){
                        Text("Set the Milestones")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .padding(.horizontal, 16)
                            .frame(width: 334,alignment: .topLeading)
                        Text("5 is a magic number for everything including final research project. So make the use of it and set the deadline!")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .padding(.horizontal, 16)
                            .frame(width: 332, height: 70, alignment: .topLeading)
                    }
                    
                    VStack(alignment: .leading, spacing: 52){
                        ForEach(0..<vm.milestones.count, id: \.self) { index in
                            HStack{

                                Text("Chapter \(index + 1)")
                                Spacer()
                                DatePicker("",
                                           selection: $vm.milestones[index].date,
                                           in: index == 0 ? Date()... : vm.milestones[index - 1].date...,
                                           displayedComponents: .date)
                                .labelsHidden()
                                .background(
                                    roundedRectangleComponent()
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 48)
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .accentColor(.black)
                }
                
                //MARK: Button
                NavigationLink {
                    HomeView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Start")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.vertical, 18)
                        .foregroundColor(Color.black)
                        .frame(width: 324)
                        .background(
                            Capsule()
                                .fill(Color.YellowThree)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.black)
                                )
                        )
                }.simultaneousGesture(TapGesture().onEnded({
                    vm.saveData()
//                    notify.scheduleNotification()
                }))
//                .disabled(isButtonDisabled)
                Spacer()
            }
        }
    }
    
}

struct DeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        DeadlineView()
    }
}
