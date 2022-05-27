//
//  TrandingView.swift
//  CryptoApp
//
//  Created by Tristan Aly on 21/05/2022.
//

import SwiftUI

struct TrandingView: View {
    
    let crypto: CryptoModel
    
    var body: some View {
        ZStack{
           
              
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Image(crypto.iconName)
                    .resizable()
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading){
                Text(crypto.symbol)
                        .font(.headline)
                        .fontWeight(.bold)
                Text(crypto.name)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            VStack(alignment: .leading,spacing: 1){
            Text("\(String(format: "%.2F", crypto.value)) €")
                HStack(spacing: 1){
                if crypto.evolution > 0{
                    Image(systemName: "plus")
                        .font(.caption2)
                }
                Text("\(String(format: "%.2F", crypto.evolution)) %")
                        .font(.caption)
                    
            }.foregroundColor(crypto.evolution > 0 ? Color.green : Color.red)
                LineGraphView(data: Sample)
                    .frame(maxHeight: 170)
            }
        }
        .padding()
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .background(Color("Background"))
        .cornerRadius(10)
        }
    }
}

struct TrandingView_Previews: PreviewProvider {
    static var previews: some View {
        TrandingView(crypto: cryptoCurrency[4])
            .previewLayout(.sizeThatFits)
    }
}
