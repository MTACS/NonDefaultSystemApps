#import <UIKit/UIKit.h>
#import <dlfcn.h>

// https://github.com/opa334/TrollStore/blob/2d762b39effa7c9cd2c5ea8fcd389516a90cd558/RootHelper/main.m#L35

typedef void (*_CFPreferencesSetValueWithContainerType)(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName, CFStringRef containerPath);
typedef Boolean (*_CFPreferencesSynchronizeWithContainerType)(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName, CFStringRef containerPath);

void override() {
	
	// https://github.com/opa334/TrollStore/blob/2d762b39effa7c9cd2c5ea8fcd389516a90cd558/RootHelper/main.m#L810
	
	_CFPreferencesSetValueWithContainerType _CFPreferencesSetValueWithContainer = (_CFPreferencesSetValueWithContainerType)dlsym(RTLD_DEFAULT, "_CFPreferencesSetValueWithContainer");
	_CFPreferencesSynchronizeWithContainerType _CFPreferencesSynchronizeWithContainer = (_CFPreferencesSynchronizeWithContainerType)dlsym(RTLD_DEFAULT, "_CFPreferencesSynchronizeWithContainer");

	_CFPreferencesSetValueWithContainer(CFSTR("SBShowNonDefaultSystemApps"), kCFBooleanTrue, CFSTR("com.apple.springboard"), CFSTR("mobile"), kCFPreferencesAnyHost, CFSTR("kCFPreferencesNoContainer"));
	_CFPreferencesSynchronizeWithContainer(CFSTR("com.apple.springboard"), CFSTR("mobile"), kCFPreferencesAnyHost, CFSTR("kCFPreferencesNoContainer"));
}

__attribute((constructor)) static void initialize() {
	override();
}
