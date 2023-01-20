//
//  noConnectionView.swift
//  BeerPedia
//
//  Created by alex popa on 19/01/23.
//

import Foundation
import SwiftUI

//SCHERMATA GESTIONE ERRORE ASSENZA INTERNET 
struct noConnectionView : View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("No network connection")
                Image(systemName: "wifi.slash")
                
            }
            Text("Check your wi-fi/cellular connection")
        }
        
    }
    
}
