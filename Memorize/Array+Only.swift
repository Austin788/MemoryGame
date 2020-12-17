//
//  Array+Only.swift
//  Memorize
//
//  Created by Austin Zheng on 2020/12/17.
//

import Foundation
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
