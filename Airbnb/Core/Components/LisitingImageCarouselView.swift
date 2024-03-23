//
//  LisitingImageCarouselView.swift
//  Airbnb
//
//  Created by Bipin Giri on 23/03/2024.
//

import SwiftUI

struct LisitingImageCarouselView: View {
    var images = ["listing-1","listing-2","listing-3","listing-3"];
    var body: some View {
        TabView{
            ForEach(images, id:\.self){
                image in Image(image).resizable()
                    .scaledToFit()
            }
        }.tabViewStyle(.page)
    }
}

#Preview {
    LisitingImageCarouselView()
}
