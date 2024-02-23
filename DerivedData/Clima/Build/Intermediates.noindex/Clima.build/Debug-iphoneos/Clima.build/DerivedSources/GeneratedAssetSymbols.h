#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.VladVorniceanu.Clima";

/// The "WeatherColor" asset catalog color resource.
static NSString * const ACColorNameWeatherColor AC_SWIFT_PRIVATE = @"WeatherColor";

/// The "background" asset catalog image resource.
static NSString * const ACImageNameBackground AC_SWIFT_PRIVATE = @"background";

#undef AC_SWIFT_PRIVATE