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

import androidx.annotation.NonNull;

import com.huawei.agc.flutter.applinking.constants.Method;
import com.huawei.agc.flutter.applinking.utils.ReplyHandler;
import com.huawei.agc.flutter.applinking.viewModel.AppLinkingViewModel;
import com.huawei.agconnect.AGConnectInstance;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class AppLinkingMethodCallHandler implements MethodCallHandler {
    private final AppLinkingViewModel appLinkingViewModel;
    private final Activity activity;

    public AppLinkingMethodCallHandler(AppLinkingViewModel service, Activity activity) {
        this.appLinkingViewModel = service;
        this.activity = activity;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (AGConnectInstance.getInstance() == null) {
            AGConnectInstance.initialize(activity.getApplicationContext());
        }
        appLinkingViewModel.setReplyHandler(new ReplyHandler(call,result));
        switch (call.method) {
            case Method.BUILD_APP_LINKING:
                appLinkingViewModel.buildLongAppLinking();
                break;
            case Method.BUILD_SHORT_APP_LINKING:
                appLinkingViewModel.buildShortAppLinking();
                break;
            case Method.Get_App_Linking:
                appLinkingViewModel.getAppLinking(activity);
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}
