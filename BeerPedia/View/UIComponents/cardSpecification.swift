//
//  cardSpecification.swift
//  BeerPedia
//
//  Created by alex popa on 19/01/23.
//

import Foundation
import SwiftUI


struct cardSpecification: View {
    
    var hint : String
    var data : String
    
    var body: some View {
        
        HStack {
            
            Text(hint)
                .font(.system(size: 12, weight: .semibold))
            Text(data)
                .font(.system(size: 10,weight: .regular))
            
        }
        
    }
    
}
