//
//  internet.swift
//  meteo application
//
//  Created by user on 2/13/23.
//  Copyright © 2023 user. All rights reserved.
//

import SwiftUI

struct internet: View {
    @State var colorTop: String
    @State var colorBottom: String
    
    var body: some View {
        ZStack(){
            BACK(colorTop: self.colorTop, colorBottom: self.colorBottom)
            VStack(){
                Image(systemName: "wifi.exclamationmark")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.bottom, 20)
                Text("erreur de connecté  à Internet...")
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
