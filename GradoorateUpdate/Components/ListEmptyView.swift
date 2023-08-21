//
//  ListEmptyView.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 21/08/23.
//

import SwiftUI

struct ListEmptyView: View {
    var body: some View {
        VStack{
            List{
                VStack(alignment: .leading){
                    HStack{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.GrayOne)
                            .frame(width: 4, height: 20)
                        Text(".....")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                        Text("🤨")
                    }
                    Text("It seem you haven't write anything")
                        .multilineTextAlignment(.leading)
                        .frame(width: 310, alignment: .topLeading)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .padding(.leading, 12)
                        .padding(.bottom, 2)
                }
                .padding(.horizontal, 32)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
    }
}

struct ListEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        ListEmptyView()
    }
}
