//
//  Config.swift
//  Shooter
//
//  Created by Drygan on 4/12/19.
//  Copyright © 2019 drygan.dev. All rights reserved.
//

import Foundation

final class Config {
    
    static let shared = Config()
    private init() { }
    
    let imageDestination: URL = {
        return FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
    }()
    
}
