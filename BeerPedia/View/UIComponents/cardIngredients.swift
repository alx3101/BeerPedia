//
//  cardIngredients.swift
//  BeerPedia
//
//  Created by alex popa on 19/01/23.
//

import Foundation
import SwiftUI

struct cardIngredients: View {
    
    
    var hintIngredient : String
    var nameIngredient : String
    var amountIngredient : String
    
    var body: some View {
        
        HStack {
            Text(hintIngredient)
                .font(.system(size: 12,weight: .semibold))
            
            VStack (alignment: .leading){
                
                Text(nameIngredient)
                    .font(.system(size: 10,weight: .light))
                Text(amountIngredient)
                    .font(.system(size: 10,weight: .thin))
            }
            .padding(5)
        }
        .padding(10)
    }
}
