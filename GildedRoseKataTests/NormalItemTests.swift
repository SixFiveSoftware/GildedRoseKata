//
//  NormalItemTests.swift
//  GildedRoseKata
//
//  Created by BJ on 7/5/15.
//  Copyright © 2015 Six Five Software, LLC. All rights reserved.
//

import XCTest

@testable import GildedRoseKata

class NormalItemTests: XCTestCase {
    
    let gildedRose = GildedRose()
    
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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneDay() {
        // given
        let expectedSellIn = 4
        let expectedQuality = 6
        
        // when
        gildedRose.updateQuality()
        let mongoose = items[2]
        
        // then 
        XCTAssertEqual(mongoose.sellIn, expectedSellIn)
        XCTAssertEqual(mongoose.quality, expectedQuality)
    }
    
    func testTwoDays() {
        // given
        let expectedSellIn = 3
        let expectedQuality = 5
        
        // when
        gildedRose.updateQuality()
        gildedRose.updateQuality()
        let mongoose = items[2]
        
        // then
        XCTAssertEqual(mongoose.sellIn, expectedSellIn)
        XCTAssertEqual(mongoose.quality, expectedQuality)
    }
    
    func testQualityDegradesTwiceAsFastAfterSellInDate() {
        // given
        let expectedSellIn = -1
        let expectedQuality = 0

        // when
        for _ in 1...6 {
            gildedRose.updateQuality()
        }
        let mongoose = items[2]
        
        // then
        XCTAssertEqual(mongoose.sellIn, expectedSellIn)
        XCTAssertEqual(mongoose.quality, expectedQuality)
    }

    func testQualityNeverGoesBelowZero() {
        // given
        let expectedQuality = 0
        
        // when
        for _ in 1...50 {
            gildedRose.updateQuality()
        }
        let mongoose = items[2]
        
        // then
        XCTAssertEqual(mongoose.quality, expectedQuality)
    }

}
