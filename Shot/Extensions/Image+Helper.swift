//
//  Image+Helper.swift
//  Shot
//
//  Created by Artsiom Sazonau on 3/17/20.
//  Copyright © 2020 Drygan Dev. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    
    func withoutScratch(_ image: CGImage) -> some View {
        if image.height < image.width {
            return self.aspectRatio(contentMode: .fill)
        } else {
            return self.aspectRatio(contentMode: .fit)
        }
    }
    
}
