//
//  CryptoDetails.swift
//  CryptoApp
//
//  Created by Tristan Aly on 21/05/2022.
//

import SwiftUI

struct CryptoDetails: View {
    
    let crypto: CryptoModel
    
    var body: some View {
        ZStack{
            Color("Background2")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(crypto.iconName)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(Color("Background2"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text(crypto.symbol)
                            .font(.system(size: 13, weight: .bold))
                        Text(crypto.name)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing,spacing: 10){
                        
                        Text("\(String(format: "%.2F",crypto.value)) €")
                        
                        HStack{
                            if crypto.evolution > 0{
                                Image(systemName: "arrow.up.right")
                            }else {
                                Image(systemName: "arrow.down.left")
                            }
                            Text("\(String(format: "%.2F",crypto.evolution)) %")
                        }
                        .foregroundColor( crypto.evolution > 0 ? Color.green : Color.red)
                    }
                }.padding()
                 .background(RoundedRectangle(cornerRadius: 10)
                 .fill(Color("Background"))
                 .frame(width: 370, height: 100))
                 .foregroundColor(.white)
                Spacer()
                HStack{
                    Button{
                        //                code..
                    } label: {
                        Text("Sell")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180, height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    Button{
                        //                code..
                    } label: {
                        Text("Buy")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180, height: 50)
                            .background(Color("Background"))
                            .cornerRadius(10)
                    }
                }
            }.padding()
        }.navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.white)
    }
}

struct CryptoDetails_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetails(crypto: cryptoCurrency[1])
    }
}
