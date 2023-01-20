//
//  imageCard.swift
//  BeerPedia
//
//  Created by alex popa on 19/01/23.
//

import Foundation
import SwiftUI
import Kingfisher

//Classe per gestione immagine nella paggina dettagli, con libreria KingFisher che rende il caricamente molto più veloce rispetto al metodo nativo
struct imageCard: View {
    
    var url : URL
    @State var image: UIImage? = nil
    
    var body: some View {
        
        VStack {
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 75,maxWidth: 300,minHeight: 75,maxHeight: 500)
                    .padding(50)
                
            } else { //Integrato progress view fino al caricamento dell'app
                ProgressView()
            }
        }.onAppear(perform: downloadImage)
    }
    
    
    //Funzione di download attraverso l'url preso dalla classe BeerViewModel
    func downloadImage() {
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                self.image = value.image
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
