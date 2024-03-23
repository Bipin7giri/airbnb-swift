//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Bipin Giri on 23/03/2024.
//

import SwiftUI

enum DestinationSearchOption{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show:Bool
    @State private var destination = "";
    @State private var selectedOption:DestinationSearchOption = .location
    var body: some View {
        VStack{
            Button{
                withAnimation(.snappy){
                    show.toggle()
                }
                
                
            }
        label: {
            Image(systemName: "xmark.circle")
                .imageScale(.large)
                .foregroundStyle(.black)
        }
            
            VStack(alignment:.leading) {
                if(selectedOption == .location){
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinantion",text:$destination)
                            .font(.subheadline)
                    }.frame(height: 44)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color(.systemGray4))
                        }
                }
                else{
                    CollapasedPickerView(title: "Where", description: "Add destination")
                }
                
            }.padding()
                .frame(height: selectedOption == .location ? 120 : 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    withAnimation(.spring){
                        selectedOption  = .location
                    }
                    
                }
            
            // date selection view
            
            VStack{
                if selectedOption == .dates{
                    HStack{
                        Text("Show expanded view")
                        Spacer()
                    }
                }
                else{
                    
                    CollapasedPickerView(title: "When", description: "Add dates")
                        .onTapGesture {
                            
                            withAnimation(.spring){
                                selectedOption  = .dates
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).onTapGesture {
                selectedOption = .dates
            }
            
            //num guest view
            
            
            VStack{
                if selectedOption == .guests{
                    
                    HStack{
                        Text("Show expanded view")
                        Spacer()
                    }
                }
                else{
                    
                    CollapasedPickerView(title: "Who", description: "When")
                        .onTapGesture {
                            
                            withAnimation(.spring){
                                selectedOption  = .guests
                            }
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).onTapGesture {
                selectedOption = .guests
            }
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapasedPickerView: View {
    let title:String
    let description:String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
            
        }
        //        .padding()
        //            .background(.white)
        //            .clipShape(RoundedRectangle(cornerRadius: 12))
        //            .padding()
        //            .shadow(radius: 10)
    }
}
