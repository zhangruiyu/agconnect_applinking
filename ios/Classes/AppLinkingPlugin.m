#import "AppLinkingPlugin.h"
#if __has_include(<agconnect_applinking/agconnect_applinking-Swift.h>)
#import <agconnect_applinking/agconnect_applinking-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "agconnect_applinking-Swift.h"
#endif
@implementation AppLinkingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [AppLinkingHandler registerWithRegistrar:registrar];
}
@end
