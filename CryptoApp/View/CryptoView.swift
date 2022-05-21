//
//  CryptoView.swift
//  CryptoApp
//
//  Created by Tristan Aly on 21/05/2022.
//

import SwiftUI

struct CryptoView: View {
    
    let crypto: CryptoModel
    var Background = "Background"
    
    var body: some View {
        HStack{
            Image(crypto.iconName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
                .background(Color("Background"))
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
        }
        .foregroundColor(.white)
        .padding()
        .background(.black.opacity(0.9))
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView(crypto: cryptoCurrency[0])
            .previewLayout(.sizeThatFits)
    }
}
