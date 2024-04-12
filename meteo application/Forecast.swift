//
//  Forecast.swift
//  meteo application
//
//  Created by user on 2/13/23.
//  Copyright © 2023 user. All rights reserved.
//

import SwiftUI

struct Forecast: View {
    let forecastData: MainForecastParams
    
    var icon: String{
        if let icon = forecastData.weather?.first?.icon {
            return icon
        } else {
            return ""
        }
    }
    
    var formattedHour: String{
        let hour = first().hourFormatter(timeStamp: Int(forecastData.dt!))
        
            return hour
        }
    var dayFormatter: String{
           let DAY = first().dayFormatter(timeStamp: Int(forecastData.dt!))
           
               return DAY
           }
    
   
    
    var ressenti: String{
        if let ressenti = forecastData.main?.feels_like {
            return "\(ressenti)°"
        } else {
            return ""
        }
    }
    
    var body: some View {
        Group{
            VStack{
                HStack{
                    imageview(urlString: "http://openweathermap.org/img/wn/\(self.icon)@2x.png", width: 80)
                    .frame(width: 50, height: 50)
                    
                    VStack{
                        Text(formattedHour)
                        Text(dayFormatter)
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(first().dateFormatter(timeStamp: Int(forecastData.dt!)))
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.frame(width: 90)
                }
                
                VStack{
                    VStack(spacing: 3){
                        Text("Ressenti:")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        HStack{
                            Image(systemName: "thermometer")
                                .foregroundColor(.black)
                            Text(ressenti)
                                .foregroundColor(.black)
                                .lineLimit(0)
                        }
                    }
                    
                   
                }
            }
        }.padding(.all, 20)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 8)
    }
}
