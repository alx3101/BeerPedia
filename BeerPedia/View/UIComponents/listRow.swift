//
//  listRow.swift
//  BeerPedia
//
//  Created by alex popa on 20/01/23.
//

import Foundation
import SwiftUI
import Kingfisher

// Cella personalizzata per la lista 

struct listRow: View {
   
   var name : String
   var description : String
   var url : URL
   var tagline : String
   @State var image: UIImage? = nil
   
   
   var body: some View {
       
       HStack
          {
              if let image = image {
                       Image(uiImage: image)
                      .resizable()
                      .scaledToFit()
                      .frame(minWidth: 75,maxWidth: 75,minHeight: 75,maxHeight: 75)
                      
                   } else {
                       ProgressView()
                   } //Per il caricamento dell'immagine ho usato la libreria di KingFisher per rendere lo scaricamento dell'immagine più rapido
             
                   
              VStack(alignment: .leading) {
                  
                  Text(name)
                      .font(.system(size: 15,weight: .bold))
                  
                  
                  Text(tagline)
                  
                      .font(.system(size: 12,weight: .light))
                  
                  Text(description)
                      .fontWeight(.ultraLight)
                      .font(.system(size: 12,weight: .ultraLight))
                      .frame(
                         
                          height:30,
                          alignment:.leadingLastTextBaseline)
                      .foregroundColor(Color(.label))
              }
              .padding(10)
              .cornerRadius(10)
              
             
          }
          .onAppear(perform: self.downloadImage)//Dove viene usata la funzione
          .frame(height: 150)
          .padding(5)
          .cornerRadius(10)
          
      }
    
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
   
