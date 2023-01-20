//
//  cardContent.swift
//  BeerPedia
//
//  Created by alex popa on 20/01/23.
//

import Foundation
import SwiftUI


struct cardContent : View {
    
    var hint : String
    var data : String
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text(hint)
                .font(.system(size: 12, weight: .semibold))
            Text(data)
                .font(.system(size: 10,weight: .regular))
                .padding(1)
        }.padding(10)
        
    }
    
    
    
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        cardContent(hint: "First Brewed", data: "23/2001")
        
        cardContent(hint: "Description", data: "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.")
        
        cardContent(hint: "Buzz with some ...", data: "Spicy carne asada with a pico de gallo sauce, Shredded chicken tacos with a mango chilli lime salsa,Cheesecake with a passion fruit swirl sauce")
        
        cardContent(hint: "Brewers Tip", data: "While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.")
    }
}
