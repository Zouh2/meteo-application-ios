//
//  topview.swift
//  meteo application
//
//  Created by user on 2/13/23.
//  Copyright © 2023 user. All rights reserved.
//

import SwiftUI
import CoreLocation

let UIWidth = UIScreen.main.bounds.width
let UIHeight = UIScreen.main.bounds.height

struct topview: View {
    @State var showField: Bool = false
    @State var isLocationTapped: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
     @ObservedObject var locationViewModel: LocationViewModel
    @State var actualFetchedCity: String = ""
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                ZStack(alignment: .leading){
                    ZStack(alignment: .leading){
                        TextField("Entrez votre ville", text: self.$forecastViewModel.cityName) {
                            self.successVibration()
                            self.fetch()
                            self.showField.toggle()
                            self.isLocationTapped = false
                            self.forecastViewModel.cityName = ""
                        }
                        .padding(.all, 10)
                        .frame(width: UIWidth-50, height: 50)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .offset(x: self.showField ? 0 : (-UIWidth / 2 - 100))
                        .animation(.spring())
                        .keyboardType(.alphabet)
                        .disabled(self.showField ? false : true)
                        .opacity(self.showField ? 1 : 0)
                    }
                    
                    HStack{
                        Image(systemName: "location.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(!self.isLocationTapped ? .white : .green)
                            .offset(x: self.showField ? (UIWidth - 90) : 10)
                            .animation(.spring())
                            .onTapGesture {
                                if !self.isLocationTapped{
                                    self.successVibration()
                                    self.getLocationAddress(location: CLLocation(latitude: self.locationViewModel.userLatitude, longitude: self.locationViewModel.userLongitude)){ address in
                                        self.forecastViewModel.cityName = address
                                        self.fetch()
                                    }
                                    self.fetch()
                                    self.forecastViewModel.cityName = ""
                                }
                                self.isLocationTapped.toggle()
                        }
                        .onAppear{
                            self.getLocationAddress(location: CLLocation(latitude: self.locationViewModel.userLatitude, longitude: self.locationViewModel.userLongitude)){ address in
                                self.forecastViewModel.cityName = address
                                
                            }
                            self.fetch()
                        }
                        
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .padding(12)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .offset(x: self.showField ? (UIWidth) : 10)
                            .animation(.spring())
                            .onTapGesture {
                                self.showField.toggle()
                        }
                    }
                }.onAppear(perform: fetch)
                
                Text(forecastViewModel.weatherDay)
                    .foregroundColor(.white)
                    .animation(.spring())
                    .offset(x: self.showField ? 0 : 70,y: self.showField ? 0 : -43)
                
            }
        }
    }
    

    private func successVibration(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    private func fetch(){
        self.forecastViewModel.searchCity()
    }
    
  
    func getLocationAddress(location:CLLocation, completion: @escaping (String) -> Void) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error)->Void in
            var placemark:CLPlacemark!
            
            if error == nil && placemarks!.count > 0 {
                placemark = placemarks![0] as CLPlacemark
                
                var addressString : String = ""
                if placemark.locality != nil {
                    addressString = addressString + placemark.locality!
                }
                
                print("-> User address: \(addressString)")
                completion(addressString)
            }
        })
    }
}
