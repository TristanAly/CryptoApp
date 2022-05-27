//
//  LineGraphView.swift
//  CryptoApp
//
//  Created by Tristan Aly on 27/05/2022.
//

import SwiftUI

struct LineGraphView: View {
    
    var data: [CGFloat]
    
    var body: some View {
        GeometryReader{ proxy in
            
            ZStack{
                let height = proxy.size.height
                let width = (proxy.size.width) / CGFloat(data.count - 1)
                
                let maxPoint = (data.max() ?? 0) + 100
                
                let points = data.enumerated().compactMap {
                    item -> CGPoint in
                    
                    let progress = item.element / maxPoint
                    
                    let pathHeight = progress * height
                    
                    let pathWidth = width * CGFloat(item.offset)
                    
                    return CGPoint(x: pathWidth, y: -pathHeight + height)
                }
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLines(points)
                    
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .fill(
                    LinearGradient(colors: [.red], startPoint: .leading, endPoint: .trailing))
                
                LinearGradient(colors: [.green,.green.opacity(0.8),.clear], startPoint: .top, endPoint: .bottom)
                    .clipShape(
                        Path{ path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLines(points)
                            
                            path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                            path.addLine(to: CGPoint(x: 0, y: height))
                        })
            }
            
        }
    }
}

struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetails(crypto: cryptoCurrency[0])
    }
}
