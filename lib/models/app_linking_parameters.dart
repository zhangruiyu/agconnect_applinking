/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/cupertino.dart';

class ApplinkingInfo {
  final SocialCardInfo socialCardInfo;
  final CampaignInfo campaignInfo;
  final AndroidLinkInfo androidLinkInfo;
  final iOSLinkInfo iosLinkInfo;
  final iTunesLinkInfo itunesLinkInfo;
  final String domainUriPrefix;
  final String deepLink;
  final String longLink;
  final String shortAppLinkingLength;
  final String previewType;
  final int expireMinute;

  ApplinkingInfo(
      {this.socialCardInfo,
      this.campaignInfo,
      this.androidLinkInfo,
      this.iosLinkInfo,
      this.itunesLinkInfo,
      this.domainUriPrefix,
      this.deepLink,
      this.longLink,
      this.shortAppLinkingLength,
      this.previewType,
      this.expireMinute});

  Map<String, dynamic> toMap() {
    return {
      'socialCardInfo': socialCardInfo?.toMap(),
      'campaignInfo': campaignInfo?.toMap(),
      'androidLinkInfo': androidLinkInfo?.toMap(),
      'iosLinkInfo': iosLinkInfo?.toMap(),
      'iTunesLinkInfo': itunesLinkInfo?.toMap(),
      'domainUriPrefix': domainUriPrefix,
      'deepLink': deepLink,
      'longLink': longLink,
      'expireMinute': expireMinute,
      'previewType': previewType,
      'shortAppLinkingLength': shortAppLinkingLength
    };
  }
}

class iTunesLinkInfo {
  final String iTunesConnectMediaType;
  final String iTunesConnectAffiliateToken;

  final String iTunesConnectProviderToken;
  final String iTunesConnectCampaignToken;

  iTunesLinkInfo(
      {this.iTunesConnectMediaType,
      this.iTunesConnectAffiliateToken,
      this.iTunesConnectProviderToken,
      this.iTunesConnectCampaignToken});

  Map<String, dynamic> toMap() {
    return {
      'iTunesConnectMediaType': iTunesConnectMediaType,
      'iTunesConnectAffiliateToken': iTunesConnectAffiliateToken,
      'iTunesConnectProviderToken': iTunesConnectProviderToken,
      'iTunesConnectCampaignToken': iTunesConnectCampaignToken
    };
  }
}

class iOSLinkInfo {
  final String iosFallbackUrl;
  final String iosBundleId;

  final String iosDeepLink;
  final String ipadBundleId;
  final String ipadFallbackUrl;

  iOSLinkInfo(
      {this.iosFallbackUrl,
      this.iosBundleId,
      this.iosDeepLink,
      this.ipadBundleId,
      this.ipadFallbackUrl});

  Map<String, dynamic> toMap() {
    return {
      'iosFallbackUrl': iosFallbackUrl,
      'iosBundleId': iosBundleId,
      'iosDeepLink': iosDeepLink,
      'ipadBundleId': ipadBundleId,
      'ipadFallbackUrl': ipadFallbackUrl,
    };
  }
}

class AndroidLinkInfo {
  final String androidFallbackUrl;
  final String androidPackageName;
  final String androidOpenType;
  final String androidDeepLink;

  AndroidLinkInfo(
      {this.androidFallbackUrl,
      this.androidPackageName,
      this.androidOpenType,
      this.androidDeepLink});

  Map<String, dynamic> toMap() {
    return {
      'androidFallbackUrl': androidFallbackUrl,
      'androidPackageName': androidPackageName,
      'androidOpenType': androidOpenType,
      'androidDeepLink': androidDeepLink,
    };
  }
}

class CampaignInfo {
  final String medium;
  final String name;
  final String source;

  CampaignInfo({this.medium, this.name, this.source});

  Map<String, dynamic> toMap() {
    return {'medium': medium, 'name': name, 'source': source};
  }
}

class SocialCardInfo {
  final String description;
  final String imageUrl;
  final String title;

  SocialCardInfo({this.description, this.imageUrl, this.title});

  Map<String, dynamic> toMap() {
    return {'description': description, 'imageUrl': imageUrl, 'title': title};
  }
}
