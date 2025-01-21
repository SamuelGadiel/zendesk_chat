#import "ZendeskHelperPlus.h"
#if __has_include(<zendesk_helper_plus/zendesk_helper_plus-Swift.h>)
#import <zendesk_helper_plus/zendesk_helper_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "zendesk_helper_plus-Swift.h"
#endif

@implementation ZendeskHelperPlus
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftZendeskHelperPlus registerWithRegistrar:registrar];
}
@end
