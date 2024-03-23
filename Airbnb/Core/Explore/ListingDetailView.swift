//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Bipin Giri on 23/03/2024.
//

import SwiftUI

struct ListingDetailView: View {
    var images = ["listing-1","listing-2","listing-3","listing-3"];
    var body: some View {
        ScrollView{
            LisitingImageCarouselView()
                .frame(height:320)
        
            VStack(alignment: .leading) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment:.leading){
                    HStack(spacing: 2){
                        Image(systemName: "start.fill")
                        Text("4.86")
                        Text("-")
                        Text("29 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    
                    .foregroundColor(.black)
                    Text("Mia, Florida")
                }    .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth:.infinity,alignment: .leading)
            
            Divider()
            
            //host info view
            HStack{
                VStack(alignment:.leading,spacing: 4){
                    Text("Entire villa hosted by Jhon Smith")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                    HStack(spacing:2){
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("4 baths")
                    }.font(.caption)
                }.frame(width: 300,alignment: .leading)
                Spacer()
                 Image("male-profle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            
            Divider()
            
            //listing features
            
            VStack(alignment:.leading,spacing: 16){
                ForEach(0 ..< 2){
                    feature in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        VStack(alignment:.leading){
                            Text("Superhost")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            
                            Text("Superhosts are experinece, highly rated hosts who are commited to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
           
            .padding()
        }
    }
}

#Preview {
    ListingDetailView()
}
