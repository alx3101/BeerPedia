//
//  networkManager.swift
//  BeerPedia
//
//  Created by alex popa on 20/01/23.
//

import Foundation
import Alamofire

class NetworkManager: ObservableObject {
    @Published var isConnected: Bool = true
    private var reachability = NetworkReachabilityManager()
    
    init() {
        reachability?.startListening(onQueue: .main, onUpdatePerforming: { [weak self] status in
            switch status {
            case .reachable:
                self?.isConnected = true
            case .notReachable:
                self?.isConnected = false
            case .unknown:
                self?.isConnected = false
            }
        })
    }
}

