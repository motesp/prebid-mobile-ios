/*   Copyright 2018-2021 Prebid.org, Inc.
 
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
 
  http://www.apache.org/licenses/LICENSE-2.0
 
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  */

import Foundation
import XCTest

@testable import PrebidMobile

protocol WinningBidResponseFabricator: RawWinningBidFabricator {
    // see extension below
}

extension WinningBidResponseFabricator {
    func makeWinningBidResponse(bidPrice: Double) -> BidResponseForRendering {
        let rawBidResponse = PBMORTBBidResponse<PBMORTBBidResponseExt, NSDictionary, PBMORTBBidExt>()
        rawBidResponse.seatbid = [.init()]
        let rawWinningBid = makeRawWinningBid(price: bidPrice, bidder: "some bidder", cacheID: "some-cache-id")
        rawBidResponse.seatbid![0].bid = [rawWinningBid]
        let bidResponse = BidResponseForRendering(jsonDictionary: rawBidResponse.toJsonDictionary() as NSDictionary)
        XCTAssertNotNil(bidResponse.winningBid)
        return bidResponse
    }
}
