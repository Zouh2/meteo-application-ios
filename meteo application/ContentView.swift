import SwiftUI

struct ContentView: View {
     var isConnected: Bool
        @State var showView: Bool = false
        @ObservedObject var forecastViewModel: ForecastViewModel
        @ObservedObject var locationViewModel: LocationViewModel
        
        init() {
            self.forecastViewModel = ForecastViewModel()
            self.locationViewModel = LocationViewModel()
            self.isConnected = Connectivity.isConnectedToInternet()
        }
        
        var body: some View {
            
            
            ZStack(){
                ZStack(alignment: .bottom){
                    ScrollView(.vertical, showsIndicators: false){
                        ZStack(alignment: .bottom){
                            BACK(colorTop: self.forecastViewModel.cityColorTop, colorBottom: self.forecastViewModel.cityColorBottom).edgesIgnoringSafeArea(.all)
                            
                            VStack{
                                topview(showField: self.showView, forecastViewModel: self.forecastViewModel, locationViewModel: locationViewModel)
                                    .padding(.top, 50)
                                
                                milieu(forecastViewModel: forecastViewModel, locationViewModel: locationViewModel)
                                
                                 bottom(forecastViewModel: forecastViewModel)
                                
                                Spacer()
                            }
                        }
                    }.edgesIgnoringSafeArea(.all)
                        .animation(.spring())
                    
                  
                }.opacity(isConnected ? 1 : 0)
                
                internet(colorTop: self.forecastViewModel.cityColorTop, colorBottom: self.forecastViewModel.cityColorBottom)
                    .opacity(isConnected ? 0 : 1)
                
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
