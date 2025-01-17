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

#import <Foundation/Foundation.h>

@class PBMVastParser;
@class PBMVastResponse;
@class PrebidRenderingConfig;
@class PBMVastAbstractAd;

@protocol PBMServerConnectionProtocol;

//TODO: alter PBMServerConnection to deliver NSData.
//Otherwise, done.

typedef void(^PBMVastAdsBuilderCompletionBlock)(NSArray<PBMVastAbstractAd *> * _Nullable, NSError * _Nullable);

@interface PBMVastAdsBuilder : NSObject

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithConnection:(nonnull id<PBMServerConnectionProtocol>)serverConnection NS_DESIGNATED_INITIALIZER;

- (void)buildAds:(nonnull NSData *)data completion:(nonnull PBMVastAdsBuilderCompletionBlock)completionBlock;

- (BOOL)checkHasNoAdsAndFireURIs:(nonnull PBMVastResponse *)vastResponse  NS_SWIFT_NAME(checkHasNoAdsAndFireURIs(vastResponse:));

@end
