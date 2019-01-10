//
//  String.swift
//  UITools
//
//  Created by Antoine Feuerstein on 09/01/2019.
//  Copyright © 2019 z-zero. All rights reserved.
//

import Foundation

public extension String {
    
    public var url: URL {
        return URL.init(string: self)!
    }
}
