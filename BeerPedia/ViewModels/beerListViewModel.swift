//
//  beerListViewModel.swift
//  BeerPedia
//
//  Created by alex popa on 18/01/23.
//

import Foundation

class BeerListViewModel : ObservableObject {
    
    
    @Published var beers: [BeerViewModel] = []
    
    //Funzione creata per il refresh dell 
    func getBeers() {
        
        APIService.shared.getBeers { (result) in
            switch result {
            case .success(let beers):
                self.beers = beers.map(BeerViewModel.init)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

    init() {
        APIService.shared.getBeers { (result) in
            switch result {
            case .success(let beers):
                self.beers = beers.map(BeerViewModel.init)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    }

