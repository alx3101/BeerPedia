//
//  beerDetailView.swift
//  BeerPedia
//
//  Created by alex popa on 18/01/23.
//

import Foundation
import SwiftUI


struct detailPage: View {

  
    var beer: BeerViewModel
  
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            
            Text(beer.tagline)
                .font(.system(size: 25,weight: .bold))
            
            VStack (alignment:.leading){
                
                    VStack {
                        imageCard(url: beer.imageURL)
                        
                    }
                    .frame(minWidth: nil,maxWidth: nil)
                    .background(Color.white)
                    .ignoresSafeArea()
                    .cornerRadius(25)
                
                //Sezione per le parti meno tecniche
                
                Text("About this beer")
                    .font(.system(size: 17,weight: .semibold))
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .frame(alignment: .leading)
                    .padding(5)
                
                VStack(alignment:.leading) {
                    //Card usate per la descrizione meno tecnica
                    cardContent(hint: "First Brewed", data: beer.firstBrewed)
                    cardContent(hint: "Description", data: beer.description)
                    cardContent(hint: "\(beer.name) with some...", data: beer.foodPairing)
                    cardContent(hint: "Brewers Tips", data: beer.brewersTips)
                    
                    
                    
                    
                    Text("Some boring data ")
                        .font(.system(size: 17,weight: .semibold))
                        .scaledToFit()
                        .foregroundColor(.accentColor)
                        .frame(alignment: .leading)
                        .padding(5)
                    
                    
                    
                    ScrollView (.horizontal,showsIndicators: false) {
                        
                        
                        //Sezione per le parti tecniche
                        
                        HStack {
                            cardSpecification(hint: "Avb:", data: String(beer.abv))
                            cardSpecification(hint: "Ibu:", data: String(beer.ibu))
                            cardSpecification(hint: "Target fg:", data: String(beer.targetFG))
                            cardSpecification(hint: "Target og:", data: String(beer.targetOG))
                            cardSpecification(hint: "Ebc:", data: String(beer.ebc))
                            cardSpecification(hint: "Srm:", data: String(beer.srm))
                            cardSpecification(hint: "PH:", data: String(beer.ph))
                            cardSpecification(hint: "Attenuation level:", data: String(beer.attenuationLevel))
                            cardSpecification(hint: "Volume:", data: "\(beer.volume.value)\(beer.volume.unit)")
                            cardSpecification(hint: "BoilVolume:", data: "\(beer.boilVolume.value)\(beer.boilVolume.unit)")
                            
                        
                            
                        }
                        .padding(11)
                        .cornerRadius(20)
                        
                        
                    }
                    
                    //Sezione per gli ingredienti e metodo di preparazione
                    Text("How is made the \(beer.name)")
                        .font(.system(size: 17,weight: .semibold))
                        .scaledToFit()
                        .foregroundColor(.accentColor)
                        .frame(alignment: .leading)
                        .padding(5)
                    
                        //In questa parte di codice siccome ingredients è nested insieme e methods ho fatto raccogliere i dati direttamente da qui dal json
                            let Hopsamount = beer.ingredients.hops.map { "\($0.amount.value) \($0.amount.unit)" }.joined(separator: ", ")
                            let Hopsname = beer.ingredients.hops.map { "\($0.name)" }.joined(separator: ", ")
                            let Maltamount = beer.ingredients.malt.map { "\($0.amount.value) \($0.amount.unit)" }.joined(separator: ", ")
                            let Maltname = beer.ingredients.malt.map { "\($0.name)" }.joined(separator: ", ")
                        
                   
                    cardIngredients(hintIngredient:"Hops",nameIngredient: Hopsname, amountIngredient: Hopsamount)
                    cardIngredients(hintIngredient:"Malt",nameIngredient: Maltname, amountIngredient: Maltamount)
                    
                
                    let mashTempValues = beer.method.mashTemp.map { "\($0.temp.value) \($0.temp.unit) for \($0.duration) minutes" }.joined(separator: ", ")
                    let fermentationTemp = String(beer.method.fermentation.temp.value) + " " + beer.method.fermentation.temp.unit

                    cardMethod(mashTemp: mashTempValues, fermantationTemp: fermentationTemp)
                    
                }
                
                Text("Contributed by:\(beer.contributedBy)")
                    .font(.system(size: 12,weight: .bold))
            }
            .padding(10)
            .frame(alignment: .top)
            .navigationTitle(beer.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



