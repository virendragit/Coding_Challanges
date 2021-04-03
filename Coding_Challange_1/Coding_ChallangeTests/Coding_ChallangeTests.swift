//
//  Coding_ChallangeTests.swift
//  Coding_ChallangeTests
//
//  Created by Virendra Gupta on 3/15/21.
//

import XCTest

@testable import Coding_Challange

class Coding_ChallangeTests: XCTestCase {

    
    func testGetAuctionDetailsFromURL(){
        let apiRepository = APIRepository()
        let mockURLSession = MockURLSession()
        apiRepository.session = mockURLSession
        apiRepository.getAuction(){actions, error in }
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "us-central1-fcg-dev-10.cloudfunctions.net")
        XCTAssertEqual(mockURLSession.cachedUrl?.path, "/AuctionDetails")
        
    }
    
    func testGetAuctionsSuccessReturnAuctions(){
        let apiRepository = APIRepository()
        let mockURLSession = MockURLSession()
        apiRepository.session = mockURLSession
        let auctionExpectation = expectation(description: "actions")
        var auctionResponse: [Auction]?
        
        apiRepository.getAuction {(actions, error) in
        auctionResponse = actions
        auctionExpectation.fulfill()
        }
        waitForExpectations(timeout: 1){ (error) in
            XCTAssertNil(auctionResponse)
        }
    }


}
