import SwiftUI
import UIKit


struct imageview: View {
    @ObservedObject var urlImageModel: UrlImageModel
    var width: Float
    
    init(urlString: String?, width: Float?) {
        urlImageModel = UrlImageModel(urlString: urlString)
        self.width = width ?? 150
    }
    var body: some View{
        Image(uiImage: urlImageModel.image ?? imageview.defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: CGFloat(self.width))
    }
    
    static var defaultImage = UIImage(named: "defaultImage")
}
