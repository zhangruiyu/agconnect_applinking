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

import 'dart:async';
import 'package:flutter/services.dart';

import 'models/app_linking_parameters.dart';
import 'models/long_app_linking.dart';
import 'models/resolved_link_data.dart';
import 'models/short_app_linking.dart';

class AGCAppLinking {
  static const MethodChannel _channel =
      const MethodChannel('com.huawei.agc.flutter.applinking_methodchannel');
  static const EventChannel _eventChannel =
      const EventChannel("com.huawei.agc.flutter.applinking_eventchannel");

  Stream<ResolvedLinkData> _onResolvedLinkData;

  Future<ShortAppLinking> buildShortAppLinking(
      ApplinkingInfo applinkingInfo) async {
    ShortAppLinking shortAppLinking = ShortAppLinking.fromMap(await _channel
        .invokeMethod('buildShortAppLinking', applinkingInfo.toMap()));

    return shortAppLinking;
  }

  Future<LongAppLinking> buildLongAppLinking(
      ApplinkingInfo applinkingInfo) async {
    LongAppLinking appLinking = LongAppLinking.fromMap(await _channel
        .invokeMethod('buildLongAppLinking', applinkingInfo.toMap()));
    return appLinking;
  }

  Stream<ResolvedLinkData> get onResolvedData {
    if (_onResolvedLinkData == null) {
      _onResolvedLinkData = _eventChannel
          .receiveBroadcastStream()
          .map((event) => ResolvedLinkData.fromMap(event));
    }
    return _onResolvedLinkData;
  }
}
