//
//  BackButton.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/21/23.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: 35, height: 35)
                .foregroundStyle(.gray)
                .overlay(
                    Image(systemName: "arrowshape.left")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
        }
        .frame(height: 30)
    }
}
#Preview {
    BackButton()
}
