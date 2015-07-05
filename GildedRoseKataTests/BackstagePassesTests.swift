//
//  BackstagePassesTests.swift
//  GildedRoseKata
//
//  Created by BJ on 7/5/15.
//  Copyright © 2015 Six Five Software, LLC. All rights reserved.
//

import XCTest

@testable import GildedRoseKata

class BackstagePassesTests: XCTestCase {
    
    var gildedrose = GildedRose()
    
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
    
    func testDayAfterConcert() {
        for _ in 1...16 {
            gildedrose.updateQuality()
        }
        
        let expectedSellIn = -1
        let expectedQuality = 0
        
        XCTAssertEqual(items[4].sellIn, expectedSellIn)
        XCTAssertEqual(items[4].quality, expectedQuality)
    }
    
    func testDayOfConcertIsHighest() {
        for _ in 1...15 {
            gildedrose.updateQuality()
        }
        
        let expectedSellIn = 0
        let expectedQuality = 50
        
        XCTAssertEqual(items[4].sellIn, expectedSellIn)
        XCTAssertEqual(items[4].quality, expectedQuality)
    }
    
    func testOneDay() {
        gildedrose.updateQuality()
        
        let expectedSellIn = 14
        let expectedQuality = 21
        
        XCTAssertEqual(items[4].quality, expectedQuality, "expected quality should be 21")
        XCTAssertEqual(items[4].sellIn, expectedSellIn, "expected sell in is equal")
    }
    
    
    func testQualityDegradesTwiceAsFastAfter10Days() {
        for _ in 1...6 {
            gildedrose.updateQuality()
        }
        
        let expectedSellIn = 9
        let expectedQuality = 27
        
        XCTAssertEqual(items[4].sellIn, expectedSellIn)
        XCTAssertEqual(items[4].quality, expectedQuality)
    }
    
    func testQualityTriplesAfter5Days() {
        for _ in 1...11 {
            gildedrose.updateQuality()
        }
        
        let expectedSellIn = 4
        let expectedQuality = 38
        
        XCTAssertEqual(items[4].sellIn, expectedSellIn)
        XCTAssertEqual(items[4].quality, expectedQuality)
    }
    
    func testQualityIsNeverNegative() {
        for _ in 1...80 {
            gildedrose.updateQuality()
        }
        
        let expectedQuality = 0
        
        XCTAssertEqual(items[4].quality, expectedQuality)
    }
    
    
}
