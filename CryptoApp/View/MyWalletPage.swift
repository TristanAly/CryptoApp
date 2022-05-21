//
//  MyWalletPage.swift
//  CryptoApp
//
//  Created by Tristan Aly on 21/05/2022.
//

import SwiftUI

struct MyWalletPage: View {
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    VStack(alignment: .leading,spacing: 15){
                        Text("77577.70 €")
                            .font(.title2)
                        Divider().frame(width: 350, height: 1).background(Color.white)
                        Text("Tranding")
                        
                    }.font(.title)
                        .padding()
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(cryptoCurrency, id: \.name){ crypto in
                                TrandingView(crypto: crypto)
                            }
                        }
                    }
                    VStack(alignment: .leading,spacing: 0.5){
                        Text("My Wallet")
                            .font(.title)
                            .padding()
                        
                        ForEach(cryptoCurrency, id: \.name) { crypto in
                            CryptoView(crypto: crypto)
                        }
                    }
                }
                .foregroundColor(.white)
                .background(Color("Background2"))
                .ignoresSafeArea(.all)
                
            }.navigationTitle("My Currency")
        }
    }
}

struct MyWalletPage_Previews: PreviewProvider {
    static var previews: some View {
        MyWalletPage()
    }
}
