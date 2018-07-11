# IOSWithRN
1.podfile
pod 'React', :path => ‘./RN/node_modules/react-native', :subspecs => [
'Core'
]
pod ‘yoga', :path => ‘./RN/node_modules/react-native/ReactCommon/yoga'


2. 运行报错

Undefined symbols for architecture x86_64:
"facebook::react::parseTypeFromHeader(facebook::react::BundleHeader const&)", referenced from:
+[RCTJavaScriptLoader attemptSynchronousLoadOfBundleAtURL:runtimeBCVersion:sourceLength:error:] in RCTJavaScriptLoader.o
"facebook::react::customJSCWrapper()", referenced from:
-[RCTDevSettings isJSCSamplingProfilerAvailable] in RCTDevSettings.o
-[RCTDevSettings toggleJSCSamplingProfiler] in RCTDevSettings.o
_RCTNSErrorFromJSErrorRef in RCTJSCErrorHandling.o
"facebook::react::systemJSCWrapper()", referenced from:
-[RCTDevSettings isJSCSamplingProfilerAvailable] in RCTDevSettings.o
-[RCTDevSettings toggleJSCSamplingProfiler] in RCTDevSettings.o
_RCTNSErrorFromJSErrorRef in RCTJSCErrorHandling.o
"_JSNoBytecodeFileFormatVersion", referenced from:
+[RCTJavaScriptLoader loadBundleAtURL:onProgress:onComplete:] in RCTJavaScriptLoader.o
+[RCTJavaScriptLoader attemptSynchronousLoadOfBundleAtURL:runtimeBCVersion:sourceLength:error:] in RCTJavaScriptLoader.o
"_OBJC_CLASS_$_RCTCxxBridge", referenced from:
objc-class-ref in RCTBridge.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)

解决：需要添加  ‘CxxBridge’，react native 0.56.0版本添加  ‘CxxBridge’ 需要Folly，如下：

pod 'React', :path => ‘./RN/node_modules/react-native', :subspecs => [
'Core’,
‘CxxBridge’,
’RCTText',
]
pod ‘yoga', :path => ‘./RN/node_modules/react-native/ReactCommon/yoga'
pod 'Folly', :podspec => ‘./RN/node_modules/react-native/third-party-podspecs/Folly.podspec'


