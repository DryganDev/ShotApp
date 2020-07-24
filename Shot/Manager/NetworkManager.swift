//
//  NetworkManager.swift
//  Shot
//
//  Created by Artsiom Sazonau on 6/8/20.
//  Copyright © 2020 Drygan Dev. All rights reserved.
//

import Foundation
import Combine

class SomeValue: ObservableObject {
    @Published var some: Int = 0
}

final class NetworkManager {
 
    var cancelable: Cancellable?
    let urlSession = URLSession(configuration: .default)
    let decoder = JSONDecoder()
    var someValue: Int?
//    var publisher: Publisher?
    var onRefreshClickValue = PassthroughSubject<String, Error>()
    func initialLoad(state: Int) {
        // auth and some
        
//        var publisher = onRefreshClickValue
//            .map{ $0.data }
//            .decode(type: Int.self, decoder: decoder)
//            .eraseToAnyPublisher()
//        let subscriber = publisher.receive(on: DispatchQueue.main).sink(receiveCompletion: { result in
//
//        }) { some in
//            self.someValue = some
//        }
    }
    
    func some() -> Int? {
        someValue
    }
    
    func onRefreshClick() {
        self.onRefreshClickValue.send("")
    }
    
}
