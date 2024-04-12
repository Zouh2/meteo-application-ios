//
//  bottom.swift
//  meteo application
//
//  Created by user on 2/13/23.
//  Copyright © 2023 user. All rights reserved.
//

import SwiftUI

struct bottom: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
        let miScreenWidth = UIScreen.main.bounds.width / 3
        
        var body: some View {
            VStack{
                Text(" méteo du semaine")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .center, spacing: 100){
                        ForEach(forecastViewModel.getForecastList(), id: \.dt){ forecast in
                            GeometryReader{ geometry in
                                Forecast(forecastData: forecast)
                            }.frame(width: 120, height: 220)
                            
                        }
                    }
                }.padding(.all, 25)
                Spacer()
                
                
            }
        }
    }
