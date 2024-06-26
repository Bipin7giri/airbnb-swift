//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Bipin Giri on 23/03/2024.
//

import SwiftUI
import MapKit
struct ListingDetailView: View {
    var images = ["listing-1","listing-2","listing-3","listing-3"];
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            ZStack(alignment:.topLeading) {
                LisitingImageCarouselView()
                    .frame(height:320)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                })
            }
            
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
            
            Divider()
            //bedroom view
            VStack(alignment:.leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack(spacing:16){
                        ForEach(1 ..< 5){
                            bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }.frame(width: 132,height: 100)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                }
                        }
                    }
                }.scrollTargetBehavior(.paging)
                
            }.padding()
            
            Divider()
            
            //list amenities
            VStack(alignment:.leading,spacing:16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(0 ..< 5){
                    feature in
                    HStack{
                        Image(systemName:"wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            VStack(alignment:.leading,spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom,64)
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment:.leading){
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                            
                        Text("Oct 15 -20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    Spacer()
                    Button {
                        
                    }
                label:{
                    Text("Reserve")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                }.padding(.horizontal,32)
            }.background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
