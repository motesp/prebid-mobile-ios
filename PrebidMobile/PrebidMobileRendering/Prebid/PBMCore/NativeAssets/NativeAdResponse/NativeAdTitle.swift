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

public class NativeAdTitle: NativeAdAsset {

    /// The text associated with the text element.
    @objc public var text: String { nativeAdMarkupAsset.title?.text ?? "" }

    /// [Integer]
    /// The length of the title being provided.
    /// Required if using assetsurl/dcourl representation, optional if using embedded asset representation.
    @objc public var length: NSNumber? { nativeAdMarkupAsset.title?.length }

    /// This object is a placeholder that may contain custom JSON agreed to by the parties to support
    /// flexibility beyond the standard defined in this specification
    @objc public var titleExt: [String : Any]? { nativeAdMarkupAsset.title?.ext }

    @objc public required init(nativeAdMarkupAsset: PBMNativeAdMarkupAsset) throws {
        guard let _ = nativeAdMarkupAsset.title else {
            throw NativeAdAssetBoxingError.noTitleInsideNativeAdMarkupAsset
        }
        try super.init(nativeAdMarkupAsset: nativeAdMarkupAsset)
    }
}
