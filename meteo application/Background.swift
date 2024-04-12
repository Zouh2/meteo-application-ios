//
//  BACK.swift
//  meteo application
//
//  Created by user on 2/13/23.
//  Copyright © 2023 user. All rights reserved.
//

import SwiftUI

struct BACK: View {
    var colorTop: String = "lightPink"
    var colorBottom: String = "lightBlue"
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color(self.colorTop), Color(self.colorBottom)]), startPoint: .top, endPoint: .bottom))
    }
}
