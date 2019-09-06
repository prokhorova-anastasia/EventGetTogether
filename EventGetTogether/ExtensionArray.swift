//
//  ExtensionArray.swift
//  EventGetTogether
//
//  Created by N on 05/09/2019.
//  Copyright © 2019 N. All rights reserved.
//

import Foundation

extension Array {
    public func get(_ index: Int) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
