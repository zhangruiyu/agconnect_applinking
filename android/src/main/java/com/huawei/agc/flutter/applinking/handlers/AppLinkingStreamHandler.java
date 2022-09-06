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

package com.huawei.agc.flutter.applinking.handlers;

import android.app.Activity;

import com.huawei.agc.flutter.applinking.utils.Utils;
import com.huawei.agconnect.AGConnectInstance;
import com.huawei.agconnect.applinking.AGConnectAppLinking;
import com.huawei.agconnect.exception.AGCException;

import io.flutter.Log;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;

public class AppLinkingStreamHandler implements StreamHandler {
    private final Activity mActivity;

    public AppLinkingStreamHandler(final Activity activity) {
        this.mActivity = activity;
//        if (AGConnectInstance.getInstance() == null) {
//            AGConnectInstance.initialize(activity.getApplicationContext());
//        }
    }

    @Override
    public void onListen(final Object arguments, final EventSink eventSink) {
//        AGConnectAppLinking.getInstance().getAppLinking(mActivity).addOnSuccessListener(resolvedLinkData -> {
//            eventSink.success(Utils.fromResolvedLinkDataToMap(resolvedLinkData));
//        }).addOnFailureListener(e -> {
//            if (e instanceof AGCException) {
//                eventSink.error("", ((AGCException) e).getErrMsg(), e.getLocalizedMessage());
//                Log.e(AppLinkingStreamHandler.class.getName(), e.getMessage());
//
//            } else {
//                eventSink.error("", e.getLocalizedMessage(), e.getMessage());
//            }
//        });
    }

    @Override
    public void onCancel(final Object arguments) {
        mActivity.unregisterReceiver(null);
    }
}