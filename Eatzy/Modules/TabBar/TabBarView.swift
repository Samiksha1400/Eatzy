//
//  TabBarView.swift
//  Eatzy
//
//  Created by shivam dahale on 25/09/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                Button(action: {
                    selectedTab = .home
                }){
                    Image(systemName: "house")
                        .foregroundColor(selectedTab == .home ? .blue : .gray)
                }
                
                Spacer()
                Button(action: {
                    selectedTab = .cart
                }){
                    Image(systemName: "cart")
                        .foregroundColor(selectedTab == .cart ? .blue : .gray)
                }
                
                Spacer()
                Button(action: {
                    selectedTab = .profile
                }){
                    Image(systemName: "person.circle")
                        .foregroundColor(selectedTab == .profile ? .blue : .gray)
                }
                Spacer()
            }
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(20)
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
