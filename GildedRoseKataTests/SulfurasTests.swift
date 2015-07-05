//
//  SulfurasTests.swift
//  GildedRoseKata
//
//  Created by BJ on 7/5/15.
//  Copyright © 2015 Six Five Software, LLC. All rights reserved.
//

import XCTest

@testable import GildedRoseKata

class SulfurasTests: XCTestCase {
    
    var gildedRose = GildedRose()
    
    override func setUp() {
        super.setUp()
        
        items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)
        ]
    }
    
    func testQualityNeverChanges() {
        // given
        let expectedSellIn = 0
        let expectedQuality = 80

        // when
        for _ in 1...80 {
            gildedRose.updateQuality()
        }
        
        // then
        XCTAssertEqual(items[3].sellIn, expectedSellIn)
        XCTAssertEqual(items[3].quality, expectedQuality)
    }
    
    
}
