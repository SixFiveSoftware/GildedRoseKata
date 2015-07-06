//
//  Items.swift
//  GildedRoseKata
//
//  Created by BJ on 7/5/15.
//  Copyright © 2015 Six Five Software, LLC. All rights reserved.
//

import Foundation

class BaseItem {
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateQuality(functionToAdjustQuality f : (Void -> Void)?) {
        item.sellIn--
        f?()
        verifyQualityInBounds()
    }
    
    func verifyQualityInBounds() {
        if item.quality > 50 {
            item.quality = 50
        }
        if item.quality < 0 {
            item.quality = 0
        }
    }
}

class Normal : BaseItem {
    
    func updateQuality() {
        super.updateQuality {
            self.item.quality = (self.item.sellIn < 0) ? self.item.quality - 2 : self.item.quality - 1
        }
    }
}

class AgedBrie : BaseItem {
    
    func updateQuality() {
        super.updateQuality {
            self.item.quality = (self.item.sellIn < 0) ? self.item.quality + 2 : self.item.quality + 1
        }
    }
}