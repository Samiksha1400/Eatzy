//
//  Extension.swift
//  Eatzy
//
//  Created by shivam dahale on 26/09/25.
//

import Foundation
import SwiftUICore

extension View {
    
    //MARK: Text Style Title
    func titleTextStyle() -> some View{
        
        self
            .font(.system(size: 24, weight: .bold))
    }
    
    //MARK: - Text Style Subtitle
    func subtitleTextStyle() -> some View{
        
        self
            .font(.system(size: 14))
            .foregroundStyle(Color.gray.opacity(0.6))
        
    }
    
    //MARK: - Button Styling Extension
    func roundedButtonBackground(cornerRadius: CGFloat,background: Color,height: CGFloat = 50,foregroundColor: Color) -> some View {
        self
            .frame(maxWidth: .infinity, minHeight: height)
            .background(background)
            .cornerRadius(cornerRadius)
            .foregroundColor(foregroundColor)
    }
    
    //MARK: - Text Styling Extension
    func roundedTextBackground(cornerRadius: CGFloat) -> some View{
        
        self
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(cornerRadius)
    }
}
