# 最后一次构建

- 结果: **success**
- 提交: `40cc1a52acebdd1e23e4f2cfc8e136de10540050`
- 时间: 2026-10-21 08:52:38 UTC

```
Command line invocation:
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/xcodebuild build -project CarNovel.xcodeproj -scheme CarNovel -configuration Release -sdk iphoneos -derivedDataPath /Users/runner/work/_temp/dd CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= CODE_SIGN_ENTITLEMENTS= ONLY_ACTIVE_ARCH=NO

Build settings from command line:
    CODE_SIGN_ENTITLEMENTS = 
    CODE_SIGN_IDENTITY = 
    CODE_SIGNING_ALLOWED = NO
    CODE_SIGNING_REQUIRED = NO
    ONLY_ACTIVE_ARCH = NO
    SDKROOT = iphoneos26.5

--- xcodebuild: WARNING: Using the first of multiple matching destinations:
{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
{ platform:macOS, arch:arm64, variant:Designed for [iPad,iPhone], id:e331dbfe2210e63abc54e083301917898c998254, name:My Mac }
{ platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS Simulator Device }
note: Using codesigning identity override: 
ComputePackagePrebuildTargetDependencyGraph

Prepare packages

CreateBuildRequest

SendProjectDescription

CreateBuildOperation

ComputeTargetDependencyGraph
note: Building targets in dependency order
note: Target dependency graph (1 target)
    Target 'CarNovel' in project 'CarNovel' (no dependencies)

GatherProvisioningInputs

CreateBuildDescription

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc --version

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld -version_details

Build description signature: 4d041b5a5499841cb6433c4f72bd6acd
Build description path: /Users/runner/work/_temp/dd/Build/Intermediates.noindex/XCBuildData/4d041b5a5499841cb6433c4f72bd6acd.xcbuilddata
ClangStatCache /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -o /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel-93a6e3579e42e0a86c252d70b5bd7bbb-VFS-iphoneos/all-product-headers.yaml
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel-93a6e3579e42e0a86c252d70b5bd7bbb-VFS-iphoneos/all-product-headers.yaml

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/CarNovel.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_const_extract_protocols.json (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_const_extract_protocols.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftFileList (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftConstValuesFileList (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.LinkFileList (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.LinkFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-OutputFileMap.json (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-OutputFileMap.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.hmap (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyStaticMetadataFileList (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyMetadataFileList (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-project-headers.hmap (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-project-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-own-target-headers.hmap (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-own-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-generated-files.hmap (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-generated-files.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-target-headers.hmap (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-non-framework-target-headers.hmap (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-non-framework-target-headers.hmap

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app

ProcessInfoPlistFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Info.plist /Users/runner/work/carnovel/carnovel/CarNovel/Info.plist (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-infoPlistUtility /Users/runner/work/carnovel/carnovel/CarNovel/Info.plist -producttype com.apple.product-type.application -genpkginfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/PkgInfo -expandbuildsettings -format binary -platform iphoneos -requiredArchitecture arm64 -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Info.plist

SwiftDriver CarNovel normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-SwiftDriver -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNovel -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios17.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-Swift.h -working-directory /Users/runner/work/carnovel/carnovel -no-emit-module-separately-wmo

SwiftDriver\ Compilation CarNovel normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-Swift-Compilation -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNovel -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios17.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-Swift.h -working-directory /Users/runner/work/carnovel/carnovel -no-emit-module-separately-wmo

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Compression-D2SZ3FDQ1XTSLIE5L4HNM0DRI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaAccessibility-DWESJ4K50PTGYP0E50JV7M1W9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaPlayer-4D94RK078HAGFV853JVZX1VE5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVKit-8NVRAUH8TX1ZK5NCYJZEAG9ZB.pcm

SwiftCompile normal arm64 Compiling\ AirPlayRouteButton.swift,\ AudioSessionConfig.swift,\ BookHTTPServer.swift,\ BookSource.swift,\ BrowserURLSheet.swift,\ CarNovelApp.swift,\ ChapterListView.swift,\ EPUBParser.swift,\ LibraryView.swift,\ LocalBookSource.swift,\ PageStore.swift,\ PageTurnPlayer.swift,\ Paginator.swift,\ PublicDomainSource.swift,\ ReadView.swift,\ RouteDiagnosticsView.swift,\ SearchView.swift,\ ShelfBook.swift,\ SourceRegistry.swift,\ TXTParser.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/AirPlayRouteButton.swift /Users/runner/work/carnovel/carnovel/CarNovel/AudioSessionConfig.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/BookHTTPServer.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/BookSource.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/BrowserURLSheet.swift /Users/runner/work/carnovel/carnovel/CarNovel/CarNovelApp.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/ChapterListView.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/EPUBParser.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/LibraryView.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/LocalBookSource.swift /Users/runner/work/carnovel/carnovel/CarNovel/PageStore.swift /Users/runner/work/carnovel/carnovel/CarNovel/PageTurnPlayer.swift /Users/runner/work/carnovel/carnovel/CarNovel/Paginator.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/PublicDomainSource.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/ReadView.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/RouteDiagnosticsView.swift /Users/runner/work/carnovel/carnovel/CarNovel/UI/SearchView.swift /Users/runner/work/carnovel/carnovel/CarNovel/Library/ShelfBook.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/SourceRegistry.swift /Users/runner/work/carnovel/carnovel/CarNovel/Sources/TXTParser.swift /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AudioToolbox.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Spatial.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DataDetection.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/OSLog.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DeveloperToolsSupport.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/MediaAccessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreGraphics.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMIDI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/QuartzCore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Synchronization.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation3.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Observation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUICore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/System.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/simd.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Foundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/XPC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Network.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreVideo.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Dispatch.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Compression.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Symbols.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Builtin_float.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UIKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreImage.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Accessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMedia.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/os.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/FileProvider.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UniformTypeIdentifiers.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation2.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ObjectiveC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Concurrency.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Metal.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/TipKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreText.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Combine.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_StringProcessing.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_SwiftData_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Darwin.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Swift.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Distributed.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation1.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_AVKit_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreTransferable.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/MediaPlayer.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVKit-8NVRAUH8TX1ZK5NCYJZEAG9ZB.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaPlayer-4D94RK078HAGFV853JVZX1VE5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Compression-D2SZ3FDQ1XTSLIE5L4HNM0DRI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaAccessibility-DWESJ4K50PTGYP0E50JV7M1W9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-dependencies-1.json (in target 'CarNovel' from project 'CarNovel')

CompileSwift normal arm64 (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    
/Users/runner/work/carnovel/carnovel/CarNovel/AudioSessionConfig.swift:122:17: warning: initialization of immutable value 'ns' was never used; consider replacing with assignment to '_' or removing it
            let ns = error as NSError
            ~~~~^~
            _

SwiftDriverJobDiscovery normal arm64 Compiling AirPlayRouteButton.swift, AudioSessionConfig.swift, BookHTTPServer.swift, BookSource.swift, BrowserURLSheet.swift, CarNovelApp.swift, ChapterListView.swift, EPUBParser.swift, LibraryView.swift, LocalBookSource.swift, PageStore.swift, PageTurnPlayer.swift, Paginator.swift, PublicDomainSource.swift, ReadView.swift, RouteDiagnosticsView.swift, SearchView.swift, ShelfBook.swift, SourceRegistry.swift, TXTParser.swift (in target 'CarNovel' from project 'CarNovel')

SwiftDriver\ Compilation\ Requirements CarNovel normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNovel -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios17.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-Swift.h -working-directory /Users/runner/work/carnovel/carnovel -no-emit-module-separately-wmo

SwiftMergeGeneratedHeaders /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources/CarNovel-Swift.h /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-Swift.h (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-swiftHeaderTool -arch arm64 /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-Swift.h -o /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/DerivedSources/CarNovel-Swift.h

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/arm64-apple-ios.swiftmodule /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftmodule (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftmodule /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/arm64-apple-ios.swiftdoc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftdoc (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftdoc /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/arm64-apple-ios.swiftdoc

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/arm64-apple-ios.abi.json /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.abi.json (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.abi.json /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftsourceinfo (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

Ld /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/CarNovel normal (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios17.0 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -Os -L/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -L/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -filelist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.LinkFileList -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_lto.o -Xlinker -dependency_info -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_dependency_info.dat -fobjc-link-runtime -L/Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.swiftmodule @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel-linker-args.resp -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/CarNovel

GenerateDSYMFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app.dSYM /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/CarNovel (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/CarNovel -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app.dSYM

ExtractAppIntentsMetadata (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.4U332g/Metal.xctoolchain --module-name CarNovel --sdk-root /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 17.0 --bundle-identifier com.lath.carnovel --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app --target-triple arm64-apple-ios17.0 --binary-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/CarNovel --dependency-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel_dependency_info.dat --stringsdata-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftFileList --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyMetadataFileList --static-metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyStaticMetadataFileList --swift-const-vals-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/Objects-normal/arm64/CarNovel.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-10-21 08:52:35.108 appintentsmetadataprocessor[1958:9593] Starting appintentsmetadataprocessor export
2026-10-21 08:52:35.126 appintentsmetadataprocessor[1958:9593] warning: Metadata extraction skipped. No AppIntents.framework dependency found.

CopySwiftLibs /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-swiftStdLibTool --copy --verbose --scan-executable /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/CarNovel --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Frameworks --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/PlugIns --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/SystemExtensions --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Extensions --platform iphoneos --toolchain /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.4U332g/Metal.xctoolchain --toolchain /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --destination /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Frameworks --strip-bitcode --strip-bitcode-tool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/bitcode_strip --emit-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/SwiftStdLibToolInputDependencies.dep --filter-for-swift-os --back-deploy-swift-span
Ignoring --strip-bitcode because --sign was not passed

AppIntentsSSUTraining (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Info.plist --temp-dir-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/ssu --bundle-id com.lath.carnovel --product-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app --extracted-metadata-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Metadata.appintents --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNovel.build/Release-iphoneos/CarNovel.build/CarNovel.DependencyMetadataFileList --source-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app/Info.plist --archive-ssu-assets
2026-10-21 08:52:35.219 appintentsnltrainingprocessor[1959:9601] Parsing options for appintentsnltrainingprocessor
2026-10-21 08:52:35.219 appintentsnltrainingprocessor[1959:9601] Starting AppIntents SSU YAML Generation
2026-10-21 08:52:35.229 appintentsnltrainingprocessor[1959:9601] No AppShortcuts found - Skipping.

RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app

Validate /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    builtin-validationUtility /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app -shallow-bundle -infoplist-subpath Info.plist

Touch /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app (in target 'CarNovel' from project 'CarNovel')
    cd /Users/runner/work/carnovel/carnovel
    /usr/bin/touch -c /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNovel.app

** BUILD SUCCEEDED **

```
