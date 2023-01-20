//
//  cardMethod.swift
//  BeerPedia
//
//  Created by alex popa on 19/01/23.
//

import Foundation
import SwiftUI

//Card method Usato per la visualizzazione dei dati sulla preparaizone della birra 
struct cardMethod: View {
    
    var mashTemp : String
    var fermantationTemp: String
    
    var body: some View {
        
        HStack {
            Text("How we prepare it:")
                .font(.system(size: 13,weight: .semibold))
            
            ScrollView(.horizontal,showsIndicators: false) {
                
                HStack {
                    
                    Text("Mast Temp:")
                        .font(.system(size: 12,weight: .semibold))
                    Text(mashTemp)
                        .font(.system(size: 10,weight: .regular))
                    
                    Text("Fermentation :")
                        .font(.system(size: 11,weight: .semibold))
                    Text(fermantationTemp)
                        .font(.system(size: 10,weight: .regular))
                    
                    
                }
                
            }.padding(5)
            
        }
        .padding(5)
        
    }
}
/*
struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        cardMethod(mashTemp: "65 Celsius for 75.0 Minutes", fermantationTemp: "19 celsius")
    }
}
*/
