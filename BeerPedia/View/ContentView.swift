//
//  ContentView.swift
//  BeerPedia
//
//  Created by alex popa on 17/01/23.
//

import SwiftUI
import CoreData
import Kingfisher



struct ContentView: View {
    
    //Network mananger viene usato per la gestione e la verifica della connessione
    @ObservedObject private var beerListViewModel = BeerListViewModel()
    @ObservedObject var networkManager = NetworkManager() // NetworkManager
    
    
    var body: some View {
        //Il tutto è integrato dentro una navigationView
        NavigationView {
            
            if (networkManager.isConnected) //In questo caso se dal manager il valore booleano è == true viene caricata la lista
            {
                if beerListViewModel.beers.isEmpty { //Aggiunto If statament per caricamento finchè la lista non carica tutti i dati dall'API
                    VStack {
                        Text("We are collecting the beers")
                        ProgressView()
                    }
                } else {
                    List{
                        ForEach(beerListViewModel.beers) { beer in  //Per ogni birra presente nell'API viene creata una custom cell
                            NavigationLink(destination: detailPage(beer: beer)) { //Passaggio per caricare la detail page e il passaggio dei dati
                                
                                listRow(name: beer.name, description: beer.description,url: beer.imageURL, tagline: beer.tagline)
                               
                            }
                        }
                    }
                    .listStyle(.inset)
                    .navigationTitle("Beers")
                    .refreshable {
                        beerListViewModel.getBeers()
                       
                    } // Ricarica della pagina quando viene tirata in basso la lista
                }
            } else  {
                //Fine dell'If statament iniziale nel caso il valore booleano == false
                //(quindi nel networkManager .case = notReachable e unKnow)
                 noConnectionView()
            }
        }
    }
}
    


   
   

