//
//  JuiceMaker - StockStorage.swift
//  Created by Wonbi, woong
//

import Foundation

class StockStorage {
    static let shared: StockStorage = StockStorage()
     var stock: [Int]?
    
    private init() {}
}
