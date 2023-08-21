//
//  FormLogView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 19/08/23.
//

import SwiftUI

struct FormLogView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var creates: Milestones
    @StateObject private var vm = ViewModel()
    @State private var importantSign = false
    @State private var unimportantSign = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("offWhite")
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack (alignment: .leading, spacing: 5){
                        
                        //MARK: TODAY'S LOG
                        VStack (spacing: 15){
                            TextFieldComponent(textLog: $vm.todaysLog, title: "Today's Log", textEmpty: "What did you do to complete this milestone?")
                            
                            //MARK: NEXT PLAN
                            TextFieldComponent(textLog: $vm.nextPlan, title: "Next Plan", textEmpty: "What is your next step to complete this milestone?")
                        }
                        
                        //MARK: LOG SIGNIFICANT
                        VStack (alignment: .leading, spacing: 15){
                            Text("Today's Log Significance")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .padding(.leading)
                            
                            HStack (spacing: 10) {
                                SignificanceButton(color: (Color.GreenOne), text: "important", isSelected: $importantSign)
                                    .onTapGesture {
                                       importantSign.toggle()
                                        if importantSign {
                                            unimportantSign = false
                                        }
                                        vm.valueSign = true
                                    }
                                SignificanceButton(color:(Color.RedOne), text: "unimportant", isSelected: $unimportantSign)
                                    .onTapGesture {
                                        unimportantSign.toggle()
                                        if unimportantSign {
                                            importantSign = false
                                        }
                                        vm.valueSign = false
                                    }
                            }
                            .padding(.leading, 10)
                            .padding(.bottom, 25)
                        }
                        
                        //MARK: FEELING
                        VStack (alignment: .leading, spacing: 15){
                            Text("My Feeling")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .padding(.leading)
                            
                            HStack (spacing: 15) {
                                Button{
                                    vm.feeling = 1
                                }label: { Text("☺️")
                                        .font(.system(size: 40))
                                        .opacity(vm.feeling == 1 ? 1 : 0.5)
                                }
                                Button{
                                    vm.feeling = 2
                                }label: { Text("😐")
                                        .font(.system(size: 40))
                                        .opacity(vm.feeling == 2 ? 1 : 0.5)
                                }
                                Button{
                                    vm.feeling = 3
                                }label: {Text("🤯")
                                        .font(.system(size: 40))
                                        .opacity(vm.feeling == 3 ? 1 : 0.5)
                                }
                            }
                            .padding(.bottom, 25)
                            .padding(.leading, 10)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 30)
                    .navigationTitle("Log Page")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItemGroup(placement: .confirmationAction){
                            Button() {
                                vm.addLog(creates: creates)
                                print("Saved")
                                dismiss()
                            } label: {
                                Text("Save")
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct FormLogView_Previews: PreviewProvider {
    static var previews: some View {
        FormLogView(creates: Milestones())
    }
}
