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


####################new branch ###############

总结：

1.直接通过localhost方式使用react native项目，react native 项目用VS Code单独开发，因为react native 项目的package.json使用的react native 版本不一致，因此将本项目中RN文件夹中的react native 版本更换，更换之后运行报错，主要是因为podfile文件的配置出现问题，更改（尤其oc项目关闭useFramework选项），pod文件内容如下：

target 'IOSWithRNDemo' do
#use_frameworks!
pod 'React', :path => ‘./RN/node_modules/react-native', :subspecs => [
'Core’,
‘CxxBridge’,
’RCTText',
‘DevSupport’,
‘RCTNetwork’,
]
pod ‘yoga', :path => ‘./RN/node_modules/react-native/ReactCommon/yoga’
pod 'Folly', :podspec => ‘./RN/node_modules/react-native/third-party-podspecs/Folly.podspec'




























