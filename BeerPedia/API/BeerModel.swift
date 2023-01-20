//
//  BeerModel.swift
//  BeerPedia
//
//  Created by alex popa on 18/01/23.
//

import Foundation
import SwiftyJSON
import Alamofire

//Questa classe è il model scritto per far passare i dati dall'API a beerViewModel
    class Beer {
        
        let id: Int
        let name: String
        let tagline: String
        let firstBrewed : String
        let description: String
        let imageURL: URL
        let abv: Double
        let ibu: Double
        let targetFG: Double
        let targetOG: Double
        let ebc: Double
        let srm: Double
        let ph: Double
        let attenuationLevel: Double
        let volume: Volume
        let boilVolume: Volume
        let method: Method
        let ingredients: Ingredients
        let foodPairing: [String]
        let brewersTips: String
        let contributedBy: String

    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.tagline = json["tagline"].stringValue
        self.firstBrewed = json["first_brewed"].stringValue
        self.description = json["description"].stringValue
        self.imageURL = URL(string: json["image_url"].stringValue)!
        self.abv = json["abv"].doubleValue
        self.ibu = json["ibu"].doubleValue
        self.targetFG = json["target_fg"].doubleValue
        self.targetOG = json["target_og"].doubleValue
        self.ebc = json["ebc"].doubleValue
        self.srm = json["srm"].doubleValue
        self.ph = json["ph"].doubleValue
        self.attenuationLevel = json["attenuation_level"].doubleValue
        self.volume = Volume(json: json["volume"])
        self.boilVolume = Volume(json: json["boil_volume"])
        self.method = Method(json: json["method"])
        self.ingredients = Ingredients(json: json["ingredients"])
        self.foodPairing = json["food_pairing"].arrayValue.map { $0.stringValue }
        self.brewersTips = json["brewers_tips"].stringValue
        self.contributedBy = json["contributed_by"].stringValue
    }
}

//Siccome i valori nel file json sono annidati ho creato le classi per ottenere i dati 

        class Volume {
            let value: Double
            let unit: String

            init(json: JSON) {
                self.value = json["value"].doubleValue
                self.unit = json["unit"].stringValue
            }
        }

        class Method {
            let mashTemp: [MashTemp]
            let fermentation: Fermentation
            let twist: String?

            init(json: JSON) {
                self.mashTemp = json["mash_temp"].arrayValue.map { MashTemp(json: $0) }
                self.fermentation = Fermentation(json: json["fermentation"])
                self.twist = json["twist"].string
            }
        }

        class MashTemp {
            let temp: Temp
            let duration: Int

            init(json: JSON) {
                self.temp = Temp(json: json["temp"])
                self.duration = json["duration"].intValue
            }
        }


        class Temp {
            let value: Double
            let unit: String

            init(json: JSON) {
                self.value = json["value"].doubleValue
                self.unit = json["unit"].stringValue
            }
        }

        class Fermentation {
            let temp: Temp

            init(json: JSON) {
                self.temp = Temp(json: json["temp"])
            }
        }

        class Ingredients {
            let malt: [Malt]
            let hops: [Hop]
            let yeast: String

            init(json: JSON) {
                self.malt = json["malt"].arrayValue.map { Malt(json: $0) }
                self.hops = json["hops"].arrayValue.map { Hop(json: $0) }
                self.yeast = json["yeast"].stringValue
            }
        }

        class Malt {
            let name: String
            let amount: Amount

            init(json: JSON) {
                self.name = json["name"].stringValue
                self.amount = Amount(json: json["amount"])
            }
        }

        class Amount {
            let value: Double
            let unit: String

            init(json: JSON) {
                self.value = json["value"].doubleValue
                self.unit = json["unit"].stringValue
            }
        }

        class Hop {
            let name: String
            let amount: Amount
            let add: String
            let attribute: String

            init(json: JSON) {
                self.name = json["name"].stringValue
                self.amount = Amount(json: json["amount"])
                self.add = json["add"].stringValue
                self.attribute = json["attribute"].stringValue
            }
        }
