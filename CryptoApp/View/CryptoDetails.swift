//
//  CryptoDetails.swift
//  CryptoApp
//
//  Created by Tristan Aly on 21/05/2022.
//

import SwiftUI

struct CryptoDetails: View {
    
    let crypto: CryptoModel
    @State var quantity: Float = 1
    
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
                        
                        Text("\(String(format: "%.2F",quantity * crypto.value)) €")
                        
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
//                Text("Quantity: \(Int(quantity))")
                Spacer()
                LineGraphView(data: Sample, crypto: crypto)
                    .frame(maxHeight: 250)
               
                Spacer()
                HStack{
                    Button{
                        quantity -= 1
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
                        quantity += 1
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
            .toolbar{
                ToolbarItem{
                    HStack{  Image(crypto.iconName)
                            .resizable()
                            .frame(width: 30, height: 30)
                    Text(crypto.symbol)
                            .font(.callout)
                        .foregroundColor(.white)
                    }.padding(.horizontal)}
                }
            }

}

struct CryptoDetails_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetails(crypto: cryptoCurrency[1])
    }
}
let Sample: [CGFloat] = [
    989,1200,750,743,643,950,1200,600,500,890,1203,1400,867,900,1250,1600,1200
]
    

