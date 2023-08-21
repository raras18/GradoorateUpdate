//
//  HomeView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 14/08/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Milestones.deadline, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Milestones>
    @State private var part: Int = 0
    var body: some View {
        ZStack {
            Color("offWhite")
                .ignoresSafeArea()
            VStack{
                //MARK: TITLE
                VStack {
                    VStack {
                        Text("Journey")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("My Final Research")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 0.5)
                        
                        HStack(spacing: 8) {
                            Text("today is")
                                .font(.system(size: 16))
                                .padding(.trailing, 2)
                            
                            Text("12 May 2023")
                                .font(.system(size: 16))
                                .foregroundColor(Color.GreenOne)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal)
                
                //MARK: ULTIMATE
                ZStack{
                    rectangleComponent()
                        .padding(8)
                    ZStack{
                        circleComponents()
                    }
                    .offset(x: -80, y: 0)
                }
                
                ZStack{
                    VStack{
                        HStack{
                            //MARK: CHAPTER 5
                            ZStack{
                                NavigationLink{
                                    LoglistView(part: .constant(5), milestones: items[4])
                                }label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.OrangeOne)
                                            .frame(width: 112, height: 120)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.black, lineWidth: 3)
                                            )
                                            .padding(.trailing, 8)
                                        HStack{
                                            Image("stair3")
                                                .resizable()
                                                .frame(width: 20, height: 115)
                                            
                                            VStack(alignment: .leading) {
                                                Text(deadline(from: items, at: 4))
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15))
                                                    .bold()
                                                
                                                Text("Ch. 5↗")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 12))
                                                    .padding(.bottom, 50)
                                            }
                                        }
                                    }
                                }
                            }
                            //MARK: CHAPTER 4
                            ZStack{
                                NavigationLink{
                                    LoglistView(part: .constant(4), milestones: items[3])
                                }label: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.OrangeOne)
                                        .frame(width: 198, height: 120)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.black, lineWidth: 3)
                                        )
                                }
                                ZStack{
                                    circleComponents()
                                }
                                .offset(x: 65, y:0)
                                
                                VStack(alignment: .leading) {
                                    Text(deadline(from: items, at: 3))
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .bold()
                                    
                                    Text("Ch. 4↗")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                    
                                }.offset(x: -50, y: 30)
                            }
                        }
                        //MARK: CHAPTER 3
                        ZStack{
                            NavigationLink{
                                LoglistView(part: .constant(3), milestones: items[2])
                            }label: {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.OrangeOne)
                                    .frame(width: 326, height: 120)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black, lineWidth: 3)
                                    ).padding(8)
                            }
                            Image("stair2")
                                .resizable()
                                .frame(width: 140, height: 118)
                                .offset(x:50, y: 0)
                            
                            ZStack{
                                circleComponents()
                            }
                            
                            VStack(alignment: .leading) {
                                Text(deadline(from: items, at: 2))
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                                    .bold()
                                
                                Text("Ch. 3↗")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                                    .padding(.bottom, 50)
                            }.offset(x: 120, y: 0)
                        }
                    }
                    //MARK: Circle Badges Chapter 5
                    ZStack{
                        circleComponents()
                    }.offset(x: -135, y: -35)
                }
                
                HStack{
                    //MARK: CHAPTER 1
                    ZStack{
                        NavigationLink{
                            LoglistView(part: .constant(1), milestones: items[0])
                        }label: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.OrangeOne)
                                .frame(width: 176, height: 120)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.black, lineWidth: 3)
                                )
                                .padding(.trailing, 8)
                        }
                        ZStack{
                            circleComponents()
                        }
                        .offset(x: 25, y: 0)
                        
                        VStack(alignment: .leading) {
                            Text(deadline(from: items, at: 0))
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                                .bold()
                            
                            Text("Ch. 1↗")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }.offset(x: -55, y: 25)
                    }
                    
                    //MARK: CHAPTER 2
                    ZStack{
                        NavigationLink{
                            LoglistView(part: .constant(2), milestones: items[1])
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.OrangeOne)
                                    .frame(width: 134, height: 120)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                VStack(alignment: .leading) {
                                    Text(deadline(from: items, at: 1))
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .bold()
                                    
                                    Text("Ch. 2↗")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                }
                                .offset(x: -25, y: -30)
                            }
                        }
                        
                        Image("stair1")
                            .resizable()
                            .frame(width: 90, height: 118)
                        
                        ZStack{
                            circleComponents()
                        }
                        .offset(x: 35, y: 40)
                    }
                }
            }
            .padding(.bottom, 40)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction){
                    Button{
                        persistanceController.shared.resetData()
                    }label: {
                        Text("Reset")
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.leading, 30)
//                    NavigationLink(
//                        destination: OnboardingView()
//                            .navigationBarBackButtonHidden(),
//                        isActive: $showNextScreen,
//                        label: { EmptyView() }
//                    )
                }
            }
            //MARK: PopUp Badges
//            ZStack{
//                Rectangle()
//                    .fill(.gray)
//                    .ignoresSafeArea()
//            }
        }
    }
//    //MARK: RESET DATA
//    private func resetData() {
//        // Implement the data reset logic here
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Milestones.fetchRequest()
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try viewContext.execute(deleteRequest)
//            try viewContext.save()
//            print("Reset")
//        } catch {
//            print("Failed to reset Core Data: \(error)")
//        }
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
