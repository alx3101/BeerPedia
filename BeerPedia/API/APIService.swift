//
//  APIService.swift
//  BeerPedia
//
//  Created by alex popa on 18/01/23.
//
import Foundation
import Alamofire
import SwiftyJSON
import Alamofire
import SwiftyJSON



//Questa classe si occupa delle richieste delle birre dall'api

class APIService {
    
    static let shared = APIService()
    let baseURL = "https://api.punkapi.com/v2/beers"
    
    func getBeers(completion: @escaping (Result<[Beer], Error>) -> Void) {
        AF.request(baseURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let beers = json.arrayValue.map { Beer(json: $0) }
                completion(.success(beers))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


