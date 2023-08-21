//
//  ContentView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 14/08/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Milestones.deadline, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Milestones>
    var body: some View {
        NavigationStack{
            if items.isEmpty{
                OnBoardingView()
            }
            else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
