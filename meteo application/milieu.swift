//
//  milieu.swift
//  meteo application
//
//  Created by user on 2/13/23.
//  Copyright © 2023 user. All rights reserved.
//

import SwiftUI

struct milieu: View {
    @State var actualPage = 1
    @ObservedObject var forecastViewModel: ForecastViewModel
    @ObservedObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack{
            Text("📍 \(self.forecastViewModel.currentCity), \(self.forecastViewModel.currentCountry)")
                .font(.system(size: 20))
                                              .foregroundColor(hexColor(0xeeeeee))
            ZStack{
                imageview(urlString: "http://openweathermap.org/img/wn/\(self.forecastViewModel.currentIcon)@2x.png", width: 150)
                
                HStack{
                    Text(self.forecastViewModel.temperature)
                        .bold()
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    Text(self.forecastViewModel.weatherDescription)
                        .foregroundColor(hexColor(0xeeeeee))
                        .opacity(0.8)
                }.padding(.top, 160)
                    .frame(width: UIScreen.main.bounds.width)
            }
           
            
           
            VStack(alignment: .center, spacing: 20){
                
                ZStack {
                 
                    VStack(alignment: .center, spacing: 20){
                        HStack(alignment: .center, spacing: 30){
                            
                            VStack{
                                Image(systemName: "wind")
                                Text("Vent")
                                    .bold()
                                Text(self.forecastViewModel.wind)
                            }
                            VStack{
                                Image(systemName: "cloud.drizzle")
                                Text("Humidité")
                                    .bold()
                                Text(self.forecastViewModel.humidity)
                            }
                            VStack{
                                Image(systemName: "thermometer")
                                Text("Max")
                                    .bold()
                                Text(self.forecastViewModel.maxTemperature)
                            }
                            
                        }
                        HStack(alignment: .center, spacing: 30){
                            VStack{
                                Image(systemName: "gauge")
                                Text("Pression")
                                    .bold()
                                Text(self.forecastViewModel.pressure)
                            }
                            
                            VStack{
                                Image(systemName: "cloud")
                                Text("Opacité")
                                    .bold()
                                Text(self.forecastViewModel.opacity)
                            }
                        }
                        
                        
                        
                    }.padding(.top, 60)
                        .padding(.bottom, 10)
                        .foregroundColor(hexColor(0xeeeeee))
                        .opacity((self.actualPage == 1) ? 0.8 : 0)
                        .animation(.spring())
                    
                   
                }
                    
                
             
            
            }
            
            Spacer()
        }
    }
}

