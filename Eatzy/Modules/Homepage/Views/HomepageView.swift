//
//  HomepageView.swift
//  Eatzy
//
//  Created by shivam dahale on 24/09/25.
//

import SwiftUI

struct HomepageView: View {
    @State var selectedTab: Tab = .home
    var body: some View {
        NavigationView {
            VStack(alignment: .leading ,spacing: 10){
                //Title
                Text("")
                    .titleTextStyle()
                
                //MARK: Search bar
                HStack{
                    Image(systemName: "magnifyingglass")
                    
                    Text("Search for restaurants, cuisines")
                        .subtitleTextStyle()
                    Spacer()
                }
                .roundedTextBackground(cornerRadius: 12)
                
                //TODO: - Promotional carosal
                HStack{
                    Image("pizza")
                    
                }
                .padding(.horizontal)
                
                //Categories
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        VStack{
                            Image("pizza")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                                .cornerRadius(10)
                            
                            Text("Pizza")
                                .font(.caption)
                        }
                    }
                }
                Spacer()
                
                TabBarView(selectedTab: $selectedTab)
            }
        }
//        .navigationBarBackButtonHidden()
        .navigationBarTitle("Hey,What are you craving?")
        
       
        
        
    }
}

#Preview {
    HomepageView()
}
