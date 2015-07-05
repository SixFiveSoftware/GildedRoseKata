//
//  AgedBrieTests.swift
//  GildedRoseKata
//
//  Created by BJ on 7/5/15.
//  Copyright © 2015 Six Five Software, LLC. All rights reserved.
//

import XCTest

@testable import GildedRoseKata

class AgedBrieTests: XCTestCase {
    
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
    
    
    func testOneDay() {
        gildedRose.updateQuality()
        
        let expectedSellIn = 1
        let expectedQuality = 1
        
        XCTAssertEqual(items[1].quality, expectedQuality, "expect quality to increase")
        XCTAssertEqual(items[1].sellIn, expectedSellIn, "expected sell in is equal")
    }
    
    func testTwoDays() {
        gildedRose.updateQuality()
        gildedRose.updateQuality()
        
        let expectedSellIn = 0
        let expectedQuality = 2
        
        XCTAssertEqual(items[1].quality, expectedQuality, "expect quality to increase")
        XCTAssertEqual(items[1].sellIn, expectedSellIn, "expected sell in is equal")
    }
    
    func testQualityDegradesTwiceAsFastAfterSellInDate() {
        for _ in 1...3 {
            gildedRose.updateQuality()
        }
        
        let expectedSellIn = -1
        let expectedQuality = 4
        
        XCTAssertEqual(items[1].sellIn, expectedSellIn)
        XCTAssertEqual(items[1].quality, expectedQuality)
    }
    
    func testQualityNeverGoesBelowZero() {
        for _ in 1...50 {
            gildedRose.updateQuality()
        }
        
        let expectedQuality = 50
        
        XCTAssertEqual(items[1].quality, expectedQuality)
    }
    
}
