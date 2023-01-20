//
//  beerViewModel.swift
//  BeerPedia
//
//  Created by alex popa on 18/01/23.
//

import Foundation

//BeerViewModel è una classe che assoccia i valori del beermodel per riutilizzarli in altre classi e struttre dell'app in questo caso beerListViewModel

    class BeerViewModel : Identifiable{
        let id: Int
        let name: String
        let tagline: String
        let firstBrewed : String
        let description: String
        let imageURL: URL
        let abv: String
        let ibu: String
        let targetFG: String
        let targetOG: String
        let ebc: String
        let srm: String
        let ph: String
        let attenuationLevel: String
        let volume: Volume
        let boilVolume: Volume
        let method: Method
        let ingredients: Ingredients
        let foodPairing: String
        let brewersTips: String
        let contributedBy: String
   

    init(beer: Beer) {
        self.id = beer.id
        self.name = beer.name
        self.tagline = beer.tagline
        self.firstBrewed = beer.firstBrewed
        self.description = beer.description
        self.imageURL = beer.imageURL
        self.abv = "\(beer.abv)%"
        self.ibu = "\(beer.ibu)"
        self.targetFG = "\(beer.targetFG)"
        self.targetOG = "\(beer.targetOG)"
        self.ebc = "\(beer.ebc)"
        self.srm = "\(beer.srm)"
        self.ph = "\(beer.ph)"
        self.attenuationLevel = "\(beer.attenuationLevel)%"
        self.volume = beer.volume
        self.boilVolume = beer.boilVolume
        self.method = beer.method
        self.ingredients = beer.ingredients
        self.foodPairing = beer.foodPairing.joined(separator: ", ")
        self.brewersTips = beer.brewersTips
        self.contributedBy = beer.contributedBy
     
    }
}
