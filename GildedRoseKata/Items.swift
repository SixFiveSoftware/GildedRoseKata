//
//  Items.swift
//  GildedRoseKata
//
//  Created by BJ on 7/5/15.
//  Copyright © 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation

class Normal {
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality() {
        item.sellIn--
        item.quality = (item.sellIn < 0) ? item.quality - 2 : item.quality - 1
        if item.quality > 50 {
            item.quality = 50
        }
        if item.quality < 0 {
            item.quality = 0
        }
    }
}