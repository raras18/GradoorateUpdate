//
//  LoglistView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 16/08/23.
//

import SwiftUI

struct LoglistView: View {
    @State private var isNext: Bool = false
    @Binding var part: Int
    @GestureState var press = false
    @StateObject var milestones: Milestones
    @StateObject var vm = ViewModel()
    
    private var sortedLogs: [Logs] {
        return milestones.logArray.sorted { $0.dateNow ?? Date() > $1.dateNow ?? Date() }
    }
    //MARK: Var Progress
    var progress: Double {
        let totalItems = 3
        let currentItemCount = 2
        return Double(currentItemCount) / Double(totalItems)
    }
    
    var body: some View {
        ZStack {
            Color("offWhite")
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    HStack (spacing: 160) {
                        Text("Chapter \(part)")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        
                        Button {
                            isNext.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .colorMultiply(.black)
                        }
                    }
                    .padding(.bottom, 10)
                    .sheet(isPresented: $isNext) {FormLogView(creates: milestones)
                            .presentationDetents([.large])
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 360, height: 150)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 2))
                            .padding(.bottom, 500)
                        
                        HStack(spacing: 20) {
                            ZStack {
                                //MARK: CIRCLE PROGRESS BAR
                                Circle()
                                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                                    .stroke(Color.OrangeOne, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                    .rotationEffect(Angle(degrees: -90))
                                    .frame(width: 88, height: 88)
                                Circle()
                                    .stroke(.black, lineWidth: 2)
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 100)
                                
                                //MARK: Button Badges
                                ZStack{
                                    //MARK: Button Budges
                                    if milestones.logArray.count >= 3 {
                                        if disableButtonBadge{
                                            ZStack{
                                                Circle()
                                                    .fill(Color("\(vm.colorData2(with: part))"))
                                                    .frame(width: 80, height: 80)
                                                Image("\(vm.badgeData(with: part))")
                                                    .resizable()
                                                    .frame(width: part.widthBadges, height: part.heightBadges)
                                                    .offset(x: part.offsetBadges, y: part == 2 ? -3 : 0 )
                                            }
                                        }
                                        else{
                                            ZStack{
                                                Circle()
                                                    .fill(Color("\(vm.colorData(with: part))"))
                                                    .opacity(press ? 0.7 : 1)
                                                    .frame(width: 80, height: 80)
                                                Image(systemName: "lock.open")
                                                    .resizable()
                                                    .frame(width: 27, height: 26)
                                                    .foregroundColor(.white)
                                            }.disabled(disableButtonBadge || disableButtonDeadline)
                                                .scaleEffect(press ? 1.25 : 1)
                                                .animation(.spring(response: 0.2, dampingFraction: 0.7))
                                                .gesture(
                                                    LongPressGesture(minimumDuration: 1.5).updating($press)
                                                    {
                                                        currentState, gestureState, transaction in gestureState = currentState
                                                    }
//                                                        .onEnded { value in
//                                                            //                                                            addBadge()
//                                                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
//                                                                isShowingPopup.toggle()
//                                                            }
//
//                                                        }
                                                )
                                        }
                                    }
                                    else {
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
                            .padding(.leading, 24)

                            
                            VStack(spacing: 5) {
                                Text("Write at least 3 logs and claim this badge by long pressing the lock icon")
                                    .font(.system(size: 16, weight: .regular, design: .rounded))
                                    .frame(width: 215)
                                    .padding(.trailing, 15)
                                
                                Text("⚠︎ If you claim the badge or the deadline has been passed, this session will end and you can’t write log or claim the badge anymore")
                                    .font(.system(size: 10, weight: .regular, design: .rounded))
                                    .fontWeight(.light)
                                    .frame(width: 220)
                                    .padding(.trailing, 20)
                            }
                        }
                        .padding(.bottom, 500)
                    }
                }

                //MARK: LIST LOGS
                VStack{
                    if milestones.logArray.isEmpty{
                        ListEmptyView()
                    }
                    else{
                        List{
                            ForEach(sortedLogs)
                            { log in
                                VStack(alignment: .leading){
                                    HStack{
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color("\(vm.performSign(sign: log.significant))"))
                                            .frame(width: 4, height: 20)
                                        Text("\(vm.formatDate(date:log.dateNow ?? Date()))")
                                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        Text("\(vm.performFeeling(feeling:Int(log.feeling)))")
                                    }
                                    Text("\(log.todayLog ?? "") ")
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 310, alignment: .topLeading)
                                        .frame(maxWidth: .infinity)
                                        .font(.system(size: 12, weight: .regular, design: .rounded))
                                        .padding(.leading, 12)
                                        .padding(.bottom, 2)
                                    
                                    Text("\(log.nextPlan ?? "") ")
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 310, alignment: .topLeading)
                                        .frame(maxWidth: .infinity)
                                        .font(.system(size: 12, weight: .regular, design: .rounded))
                                        .foregroundColor(.gray)
                                        .padding(.leading, 12)
                                        .padding(.bottom, 2)
                                }.padding(.horizontal, 32)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                            }
//                            .onDelete{offsets in
//                                if (disableButtonDeadline || disableButtonBadge) {
//                                    showDeleteAlert = true
//                                }
//                                else{
//                                    deleteLog(at: offsets)
//                                }
//                            }
//                            .alert(isPresented: $showDeleteAlert) {
//                                Alert(
//                                    title: Text("Deletion Disabled"),
//                                    message: Text("Swipe deletion is currently disabled."),
//                                    dismissButton: .default(Text("OK"))
//                                )
//                            }
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .padding(.top, 250)
                .listRowInsets(.init(top: 0, leading: 25, bottom: 0, trailing: 25))
                
            }
            .navigationViewStyle(.stack)
            .navigationTitle("My Daily Log")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 20)
            
//            ZStack{
//                Rectangle()
//                    .fill(.gray)
//                    .opacity(isShowingPopup ? 0.7 : 0)
//                    .ignoresSafeArea()
//            }
        }
    }
    
    //MARK: Var Disable Button
    private var disableButtonBadge: Bool {
        return milestones.badgeArray.count > 0
    }
    
    private var disableButtonDeadline: Bool {
        let lock: Bool
        if Date() > milestones.deadline ?? Date(){
            lock = true
        }
        else{
            lock = false
        }
        return lock
    }
}

//struct LoglistView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoglistView(part: .constant(1))
//    }
//}
