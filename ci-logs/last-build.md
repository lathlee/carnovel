# CarNotify 最后一次构建

- 结果: **success**
- 提交: `e9e73ecd616a47e1737ed788f979c981e4527bff`
- 时间: 2026-10-16 05:17:29 UTC

## 错误摘要

```
```

## 协议自检（WsFrame / 状态机）

```
WsFrame 交叉验证
  encode/decode 逻辑：NotifyServer.swift 的逐行搬运
  基准：aptv-notify/notify_server.py（已在真机 + 车机上跑通）

通过 95 / 95
NotifyServer 状态机交叉验证
  headers / body / websocket 三态机 + 路由 + 握手 Accept

通过 65 / 65
```

## 完整日志（末尾 2500 行）

```
Command line invocation:
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/xcodebuild build -project CarNotify.xcodeproj -scheme CarNotify -configuration Release -sdk iphoneos -derivedDataPath /Users/runner/work/_temp/dd CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= CODE_SIGN_ENTITLEMENTS= ONLY_ACTIVE_ARCH=NO

Build settings from command line:
    CODE_SIGN_ENTITLEMENTS = 
    CODE_SIGN_IDENTITY = 
    CODE_SIGNING_ALLOWED = NO
    CODE_SIGNING_REQUIRED = NO
    ONLY_ACTIVE_ARCH = NO
    SDKROOT = iphoneos26.5

--- xcodebuild: WARNING: Using the first of multiple matching destinations:
{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
{ platform:macOS, arch:arm64, variant:Designed for [iPad,iPhone], id:2f9f2e3b75480092a79df48073bd2badd94ed405, name:My Mac }
{ platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS Simulator Device }
note: Using codesigning identity override: 
ComputePackagePrebuildTargetDependencyGraph

Prepare packages

CreateBuildRequest

SendProjectDescription

CreateBuildOperation

ComputeTargetDependencyGraph
note: Building targets in dependency order
note: Target dependency graph (2 targets)
    Target 'CarNotify' in project 'CarNotify'
        ➜ Explicit dependency on target 'CarNotifyWidget' in project 'CarNotify'
    Target 'CarNotifyWidget' in project 'CarNotify' (no dependencies)

GatherProvisioningInputs

CreateBuildDescription

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc --version

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --print-asset-tag-combinations --output-format xml1 /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Assets.xcassets

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld -version_details

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --version --output-format xml1

Build description signature: 48f676b8e6b8676a3da7d3fa053a470f
Build description path: /Users/runner/work/_temp/dd/Build/Intermediates.noindex/XCBuildData/48f676b8e6b8676a3da7d3fa053a470f.xcbuilddata
CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex

ClangStatCache /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -o /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify-c5d5ac02321cba643b1c2853ab147545-VFS-iphoneos/all-product-headers.yaml
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify-c5d5ac02321cba643b1c2853ab147545-VFS-iphoneos/all-product-headers.yaml

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_const_extract_protocols.json (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_const_extract_protocols.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftFileList (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftConstValuesFileList (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.LinkFileList (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.LinkFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-OutputFileMap.json (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-OutputFileMap.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.hmap (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyStaticMetadataFileList (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyMetadataFileList (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-project-headers.hmap (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-project-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-own-target-headers.hmap (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-own-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-generated-files.hmap (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-generated-files.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-target-headers.hmap (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-non-framework-target-headers.hmap (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-non-framework-target-headers.hmap

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_const_extract_protocols.json (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_const_extract_protocols.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftFileList (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftConstValuesFileList (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.LinkFileList (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.LinkFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-OutputFileMap.json (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-OutputFileMap.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.hmap (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyStaticMetadataFileList (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyMetadataFileList (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-project-headers.hmap (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-project-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-own-target-headers.hmap (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-own-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-generated-files.hmap (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-generated-files.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-target-headers.hmap (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-non-framework-target-headers.hmap (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-non-framework-target-headers.hmap

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app

ProcessInfoPlistFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/Info.plist /Users/runner/work/carnovel/carnovel/CarNotify/CarNotifyWidget/Info.plist (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-infoPlistUtility /Users/runner/work/carnovel/carnovel/CarNotify/CarNotifyWidget/Info.plist -producttype com.apple.product-type.app-extension -expandbuildsettings -format binary -platform iphoneos -requiredArchitecture arm64 -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/Info.plist

SwiftDriver CarNotifyWidget normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-SwiftDriver -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNotifyWidget -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -application-extension -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/CarNotify -no-emit-module-separately-wmo

SwiftDriver\ Compilation CarNotifyWidget normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-Swift-Compilation -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNotifyWidget -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -application-extension -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/CarNotify -no-emit-module-separately-wmo

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7DTPA61KKGBW4ULZIJYQITHOI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-9O1XU7Q5T845GJNQSHDTOE5Y5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-8XKF6NRL15JSCFDYBOKVSRVRZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-B282392CGKFWCLEMKPGBTV9RD.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-OYG5GWQQG98K5SCN8TWKER6A.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-3FZZTSIUBUA1KRORHZKMYA6VQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-1T26EUKOT96UMXDBPK5WVJ5GC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-D26T7JY0YLDHXDYICB4IV03D4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-7REJB1J1WIDJBYORAL310OUTP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-1HSH21VSSPEEKBPQCO08IHSWX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-4C6LBU7PTHAV6XC2QLPREP69X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-8AD14FXKH5RY5UEAVSZ26EVSM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-BLY24VSMOFYN14L73VYQ2T2N.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-1SQ8MTXCDSUIRURUH3SH0FL82.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-5JJH98BE2POEE10TSBJMR5XPX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-5RYPN57NCL09KD8F962KKDOEI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-E8PGPLXSHMEJC7K1LX6T5TUPB.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-ASDKUYB82TRKRGU4OBT9CK7TI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-CV6YCR5UIHDDISWQVNMJQMZKR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-A6SCEM0PLEVYT5BASYAPJY8IO.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-633N89HT1O8CKTP2JVAO98EWW.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-6DXZO0M5ET5ZOSOS9FV0G581T.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-32LCKZSQ1O7A2S2RQXB8EHUT5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-CI3CAIUHQ455ARMT0CN4WFM4G.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-BF8OQT15SY9387GOKAE9SEEAY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-41WZQLBZAQI2AVMW1QSXOKZ3.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-7ZX5LVQIDC9082A7LN2LRG9BW.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-2N28DDU1KNYN1XO225Q6BRA2A.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-ZSL4QP4A8SIJTEYGE8N5NCCI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-8VEQKT6YFNRYF47YQJUB6ZWUT.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-F4UKG8WCZCP800CTXI2ZNOAE4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-BZMSSM5GZM2KF6JO4T8FXEOIV.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-48COXUJ3I4QJN37G8UVVVM2Q5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os-351KUTMBKNPOOZ6PBGYK44HAX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-AKWNTZNSAOO24EZIRBR846CAN.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-5ESYDT8UYIYNGQD9QFV2XYEVS.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-EX9EZAL4G6ZM7VUECJ3ZPG52R.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-2OJBINBS0H38IB24I56EIILAK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-A9HV16ZZOS1G5C2NP6W20RAZ6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-6GK65I3EUBH6K6SRCEKGXDMNK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-B57A5N390NI3ODKTSUFKI3TH8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-60Y2QACUXR53HTE75XJRTVR3Q.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-8K6G286SEW15UOKGDFDBVDPY1.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-460UUEDFYXO79D6WP6DT9FEUD.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-9MWA2NJP73XMZ3PHQ4Z77X0G5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-56VN40UMHNNBA8TLN1NVOHBMK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-96CWJG1LJ41B54064I1CO5NA4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-EJPE7LKZXDRJCQM3VYKY0LRXK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-3B7L4E4L0V6JYHTRGWC582KUR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-17DG0JNI3TVJJM6RRMN5YCZKX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-8TWSRBOGTUQWATDK4N9XYV3GG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-2OV7QSMSB36423IAZRULJWI26.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-3XOWTJWNP5CC30E57TNMWDGS8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-DY1R7VQ92R4PJTQ8ICLPOPTMC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-DWBBPWFQSZBVK8TJUBK1IDT6K.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-273S5334UBGYO8SF0JC5FO5ON.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-8GAXMQPMBOAEQT1GI2ZRJWG5X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-AZXYTXI2IW8VMC804GXX4P0X0.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-7W90HYLVIW6N65T43YHM541XM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-2APT02150FYBDJRU4KKKL52JE.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-511PVCLEUU2F0WEWB7DV4PK9H.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-DVUCIH10JO1LCQWD1PH199DZJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-745HAB3QPD91O83ZTWWRDPEZ6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-C69TAMZEHGR1UMK39UNOUTA3U.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-CMW1YJCG2PVXDFSR9N6UZK2F9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ERTG8D0CCSVBUVNGSGLLL86E4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-7RU5NPBTALAWVZW34GYD3B0UN.pcm

SwiftCompile normal arm64 Compiling\ CarNotifyWidget.swift,\ NotificationActivityAttributes.swift,\ NotificationLiveActivity.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotifyWidget/CarNotifyWidget.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Shared/NotificationActivityAttributes.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotifyWidget/NotificationLiveActivity.swift /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation2.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Distributed.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ActivityKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation3.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreVideo.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UniformTypeIdentifiers.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreImage.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUICore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Accessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/OSLog.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Observation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/XPC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/QuartzCore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Swift.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/RelevanceKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/System.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Concurrency.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UIKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Spatial.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Darwin.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Dispatch.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Intents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_StringProcessing.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreSpotlight.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/WidgetKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LightweightCodeRequirements.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/os.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AppIntents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DataDetection.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_AppIntents_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/FileProvider.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DeveloperToolsSupport.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreTransferable.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ObjectiveC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ExtensionFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation1.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Metal.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreLocation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Builtin_float.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreGraphics.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Symbols.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Foundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/simd.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreText.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Network.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Combine.swiftmodule/arm64e-apple-ios.swiftmodule /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-BF8OQT15SY9387GOKAE9SEEAY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-B57A5N390NI3ODKTSUFKI3TH8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-8VEQKT6YFNRYF47YQJUB6ZWUT.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-511PVCLEUU2F0WEWB7DV4PK9H.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-60Y2QACUXR53HTE75XJRTVR3Q.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-2APT02150FYBDJRU4KKKL52JE.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-7REJB1J1WIDJBYORAL310OUTP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-9MWA2NJP73XMZ3PHQ4Z77X0G5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-17DG0JNI3TVJJM6RRMN5YCZKX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-8GAXMQPMBOAEQT1GI2ZRJWG5X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-1HSH21VSSPEEKBPQCO08IHSWX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-273S5334UBGYO8SF0JC5FO5ON.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-CI3CAIUHQ455ARMT0CN4WFM4G.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-5JJH98BE2POEE10TSBJMR5XPX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-DY1R7VQ92R4PJTQ8ICLPOPTMC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-3B7L4E4L0V6JYHTRGWC582KUR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-4C6LBU7PTHAV6XC2QLPREP69X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-2N28DDU1KNYN1XO225Q6BRA2A.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-A6SCEM0PLEVYT5BASYAPJY8IO.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-8TWSRBOGTUQWATDK4N9XYV3GG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-1SQ8MTXCDSUIRURUH3SH0FL82.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-BLY24VSMOFYN14L73VYQ2T2N.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-BZMSSM5GZM2KF6JO4T8FXEOIV.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-41WZQLBZAQI2AVMW1QSXOKZ3.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-633N89HT1O8CKTP2JVAO98EWW.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-56VN40UMHNNBA8TLN1NVOHBMK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-CV6YCR5UIHDDISWQVNMJQMZKR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-F4UKG8WCZCP800CTXI2ZNOAE4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-3FZZTSIUBUA1KRORHZKMYA6VQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-E8PGPLXSHMEJC7K1LX6T5TUPB.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-8XKF6NRL15JSCFDYBOKVSRVRZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-2OV7QSMSB36423IAZRULJWI26.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-5ESYDT8UYIYNGQD9QFV2XYEVS.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-745HAB3QPD91O83ZTWWRDPEZ6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-7W90HYLVIW6N65T43YHM541XM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-96CWJG1LJ41B54064I1CO5NA4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-5RYPN57NCL09KD8F962KKDOEI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-AZXYTXI2IW8VMC804GXX4P0X0.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-CMW1YJCG2PVXDFSR9N6UZK2F9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7DTPA61KKGBW4ULZIJYQITHOI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-7ZX5LVQIDC9082A7LN2LRG9BW.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-EX9EZAL4G6ZM7VUECJ3ZPG52R.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-6DXZO0M5ET5ZOSOS9FV0G581T.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-C69TAMZEHGR1UMK39UNOUTA3U.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-AKWNTZNSAOO24EZIRBR846CAN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ERTG8D0CCSVBUVNGSGLLL86E4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-3XOWTJWNP5CC30E57TNMWDGS8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-48COXUJ3I4QJN37G8UVVVM2Q5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os-351KUTMBKNPOOZ6PBGYK44HAX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-7RU5NPBTALAWVZW34GYD3B0UN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-1T26EUKOT96UMXDBPK5WVJ5GC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-D26T7JY0YLDHXDYICB4IV03D4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-6GK65I3EUBH6K6SRCEKGXDMNK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-OYG5GWQQG98K5SCN8TWKER6A.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-460UUEDFYXO79D6WP6DT9FEUD.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-A9HV16ZZOS1G5C2NP6W20RAZ6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-8K6G286SEW15UOKGDFDBVDPY1.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-B282392CGKFWCLEMKPGBTV9RD.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-ASDKUYB82TRKRGU4OBT9CK7TI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-DWBBPWFQSZBVK8TJUBK1IDT6K.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-EJPE7LKZXDRJCQM3VYKY0LRXK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-2OJBINBS0H38IB24I56EIILAK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-8AD14FXKH5RY5UEAVSZ26EVSM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-ZSL4QP4A8SIJTEYGE8N5NCCI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-DVUCIH10JO1LCQWD1PH199DZJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-9O1XU7Q5T845GJNQSHDTOE5Y5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-32LCKZSQ1O7A2S2RQXB8EHUT5.pcm /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-dependencies-1.json (in target 'CarNotifyWidget' from project 'CarNotify')

CompileSwift normal arm64 (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    

SwiftDriverJobDiscovery normal arm64 Compiling CarNotifyWidget.swift, NotificationActivityAttributes.swift, NotificationLiveActivity.swift (in target 'CarNotifyWidget' from project 'CarNotify')

SwiftDriver\ Compilation\ Requirements CarNotifyWidget normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNotifyWidget -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -application-extension -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/CarNotify -no-emit-module-separately-wmo

SwiftMergeGeneratedHeaders /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources/CarNotifyWidget-Swift.h /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-Swift.h (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-swiftHeaderTool -arch arm64 /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-Swift.h -o /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/DerivedSources/CarNotifyWidget-Swift.h

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/arm64-apple-ios.swiftmodule /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftmodule (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftmodule /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/arm64-apple-ios.swiftdoc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftdoc (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftdoc /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/arm64-apple-ios.swiftdoc

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/arm64-apple-ios.abi.json /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.abi.json (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.abi.json /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftsourceinfo (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

Ld /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/CarNotifyWidget normal (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios18.0 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -Os -L/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -L/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -filelist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.LinkFileList -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -rpath -Xlinker @executable_path/../../Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_lto.o -Xlinker -dependency_info -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_dependency_info.dat -e _NSExtensionMain -fapplication-extension -fobjc-link-runtime -L/Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.swiftmodule @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget-linker-args.resp -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/CarNotifyWidget

MkDir /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/unthinned (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/unthinned

MkDir /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/thinned (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/thinned

GenerateAssetSymbols /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Assets.xcassets (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Assets.xcassets --compile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app --output-format human-readable-text --notices --warnings --export-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_dependencies --output-partial-info-plist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist --app-icon AppIcon --compress-pngs --enable-on-demand-resources YES --development-region en --target-device iphone --minimum-deployment-target 18.0 --platform iphoneos --bundle-identifier com.lath.carnotify --generate-swift-asset-symbol-extensions NO --generate-swift-asset-symbols /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols.swift --generate-objc-asset-symbols /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols.h --generate-asset-symbol-index /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols-Index.plist
/* com.apple.actool.compilation-results */
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols-Index.plist
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols.h
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols.swift


CompileAssetCatalogVariant thinned /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Assets.xcassets (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Assets.xcassets --compile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/thinned --output-format human-readable-text --notices --warnings --export-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_dependencies_thinned --output-partial-info-plist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist_thinned --app-icon AppIcon --compress-pngs --enable-on-demand-resources YES --development-region en --target-device iphone --minimum-deployment-target 18.0 --platform iphoneos
/* com.apple.actool.compilation-results */
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist_thinned
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/thinned/AppIcon60x60@2x.png
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/thinned/Assets.car


SwiftDriver CarNotify normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-SwiftDriver -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNotify -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/CarNotify -no-emit-module-separately-wmo

GenerateDSYMFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex.dSYM /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/CarNotifyWidget (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/CarNotifyWidget -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex.dSYM

ExtractAppIntentsMetadata (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.M2ofRv/Metal.xctoolchain --module-name CarNotifyWidget --sdk-root /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 18.0 --bundle-identifier com.lath.carnotify.widget --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex --target-triple arm64-apple-ios18.0 --binary-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/CarNotifyWidget --dependency-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget_dependency_info.dat --stringsdata-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftFileList --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyMetadataFileList --static-metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyStaticMetadataFileList --swift-const-vals-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/Objects-normal/arm64/CarNotifyWidget.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-10-16 05:17:15.288 appintentsmetadataprocessor[3558:14848] Starting appintentsmetadataprocessor export
2026-10-16 05:17:15.326 appintentsmetadataprocessor[3558:14848] Writing Metadata.appintents
2026-10-16 05:17:15.326 appintentsmetadataprocessor[3558:14848] Metadata root: /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/Metadata.appintents

AppIntentsSSUTraining (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/Info.plist --temp-dir-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/ssu --bundle-id com.lath.carnotify.widget --product-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex --extracted-metadata-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/Metadata.appintents --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotifyWidget.build/CarNotifyWidget.DependencyMetadataFileList --source-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex/Info.plist --archive-ssu-assets
2026-10-16 05:17:15.361 appintentsnltrainingprocessor[3562:14863] Parsing options for appintentsnltrainingprocessor
2026-10-16 05:17:15.362 appintentsnltrainingprocessor[3562:14863] Starting AppIntents SSU YAML Generation
2026-10-16 05:17:15.379 appintentsnltrainingprocessor[3562:14863] No AppShortcuts found - Skipping.

RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex

Touch /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex (in target 'CarNotifyWidget' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /usr/bin/touch -c /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex

CpResource /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/rtos.wasm /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Pkg/rtos.wasm (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Pkg/rtos.wasm /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app

CpResource /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/index.html /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Pkg/index.html (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Pkg/index.html /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app

SwiftDriver\ Compilation CarNotify normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-Swift-Compilation -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNotify -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/CarNotify -no-emit-module-separately-wmo

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-E1LNGX12II2VGQC3T5IRTF1L.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-6LTKT6G2T4QJJ5WT8RYINZP5H.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-EHSIDUR2LNY2JYRSYLGGSYB2D.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-EBGVGKRIZIXZUXX0JH789I98B.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-ACEXB0PPYHQ00EUIIIZU4X671.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-BPNECTK3MPXQG4WOSUR3NKCU6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/LocalAuthentication-3N23IL8ZKRS277BU1G462CEAP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-9HAKQ8RW8U11HG4YX4VC45O7H.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-DJL8OAP6SBMDEHNOIHKUS5JKM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-6HT9KPLP2HX8TC95E4UNAAMQV.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm

SwiftCompile normal arm64 Compiling\ BackgroundKeepAlive.swift,\ CarNotifyApp.swift,\ ContentView.swift,\ NotificationActivityAttributes.swift,\ NotifyServer.swift,\ GeneratedAssetSymbols.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/BackgroundKeepAlive.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/App/CarNotifyApp.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/UI/ContentView.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Shared/NotificationActivityAttributes.swift /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/NotifyServer.swift /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/GeneratedAssetSymbols.swift /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Swift.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AudioToolbox.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Network.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Foundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Concurrency.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AppIntents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/FileProvider.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Accessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LightweightCodeRequirements.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Intents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation2.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUICore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Combine.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreText.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMIDI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/System.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ActivityKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreSpotlight.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ObjectiveC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DataDetection.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreLocation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/XPC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UniformTypeIdentifiers.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Synchronization.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Spatial.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Symbols.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/QuartzCore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/os.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation3.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMedia.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/simd.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_StringProcessing.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Darwin.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CryptoKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Metal.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UIKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DeveloperToolsSupport.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreTransferable.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Observation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreImage.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreGraphics.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation1.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ExtensionFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/OSLog.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LocalAuthentication.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_AppIntents_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Builtin_float.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Dispatch.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreVideo.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/WidgetKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/RelevanceKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Distributed.swiftmodule/arm64e-apple-ios.swiftmodule /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-6HT9KPLP2HX8TC95E4UNAAMQV.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-9HAKQ8RW8U11HG4YX4VC45O7H.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-6LTKT6G2T4QJJ5WT8RYINZP5H.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/LocalAuthentication-3N23IL8ZKRS277BU1G462CEAP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-E1LNGX12II2VGQC3T5IRTF1L.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-EHSIDUR2LNY2JYRSYLGGSYB2D.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-DJL8OAP6SBMDEHNOIHKUS5JKM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-EBGVGKRIZIXZUXX0JH789I98B.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-ACEXB0PPYHQ00EUIIIZU4X671.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-BPNECTK3MPXQG4WOSUR3NKCU6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-dependencies-1.json (in target 'CarNotify' from project 'CarNotify')

CompileSwift normal arm64 (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    

SwiftDriverJobDiscovery normal arm64 Compiling BackgroundKeepAlive.swift, CarNotifyApp.swift, ContentView.swift, NotificationActivityAttributes.swift, NotifyServer.swift, GeneratedAssetSymbols.swift (in target 'CarNotify' from project 'CarNotify')

SwiftDriver\ Compilation\ Requirements CarNotify normal arm64 com.apple.xcode.tools.swift.compiler (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name CarNotify -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/CarNotify -no-emit-module-separately-wmo

SwiftMergeGeneratedHeaders /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/CarNotify-Swift.h /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-Swift.h (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-swiftHeaderTool -arch arm64 /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-Swift.h -o /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/DerivedSources/CarNotify-Swift.h

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/arm64-apple-ios.swiftmodule /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftmodule (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftmodule /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/arm64-apple-ios.swiftdoc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftdoc (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftdoc /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/arm64-apple-ios.swiftdoc

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/arm64-apple-ios.abi.json /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.abi.json (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.abi.json /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftsourceinfo (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

Ld /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/CarNotify normal (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios18.0 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -Os -L/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -L/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -filelist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.LinkFileList -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_lto.o -Xlinker -dependency_info -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_dependency_info.dat -fobjc-link-runtime -L/Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.swiftmodule @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify-linker-args.resp -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/CarNotify

LinkAssetCatalog /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Assets.xcassets (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-linkAssetCatalog --thinned /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/thinned --thinned-dependencies /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_dependencies_thinned --thinned-info-plist-content /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist_thinned --unthinned /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_output/unthinned --unthinned-dependencies /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_dependencies_unthinned --unthinned-info-plist-content /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist_unthinned --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app --plist-output /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist
note: Emplaced /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Assets.car (in target 'CarNotify' from project 'CarNotify')
note: Emplaced /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/AppIcon60x60@2x.png (in target 'CarNotify' from project 'CarNotify')

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns/CarNotifyWidget.appex /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -exclude Headers -exclude PrivateHeaders -exclude Modules -exclude \*.tbd -resolve-src-symlinks -remove-static-executable /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotifyWidget.appex /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns

ProcessInfoPlistFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Info.plist /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Info.plist (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-infoPlistUtility /Users/runner/work/carnovel/carnovel/CarNotify/CarNotify/Info.plist -producttype com.apple.product-type.application -genpkginfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PkgInfo -expandbuildsettings -format binary -platform iphoneos -additionalcontentfile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/assetcatalog_generated_info.plist -scanforprivacyfile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns/CarNotifyWidget.appex -requiredArchitecture arm64 -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Info.plist

ExtractAppIntentsMetadata (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.M2ofRv/Metal.xctoolchain --module-name CarNotify --sdk-root /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 18.0 --bundle-identifier com.lath.carnotify --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app --target-triple arm64-apple-ios18.0 --binary-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/CarNotify --dependency-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify_dependency_info.dat --stringsdata-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftFileList --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyMetadataFileList --static-metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyStaticMetadataFileList --swift-const-vals-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/Objects-normal/arm64/CarNotify.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-10-16 05:17:24.187 appintentsmetadataprocessor[3871:15551] Starting appintentsmetadataprocessor export
2026-10-16 05:17:24.203 appintentsmetadataprocessor[3871:15551] Extracted no relevant App Intents symbols, skipping writing output

CopySwiftLibs /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-swiftStdLibTool --copy --verbose --scan-executable /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/CarNotify --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Frameworks --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/SystemExtensions --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Extensions --platform iphoneos --toolchain /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.M2ofRv/Metal.xctoolchain --toolchain /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --destination /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Frameworks --strip-bitcode --strip-bitcode-tool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/bitcode_strip --emit-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/SwiftStdLibToolInputDependencies.dep --filter-for-swift-os --back-deploy-swift-span
Ignoring --strip-bitcode because --sign was not passed

ValidateEmbeddedBinary /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns/CarNotifyWidget.appex (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/embeddedBinaryValidationUtility /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/PlugIns/CarNotifyWidget.appex -info-plist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Info.plist

GenerateDSYMFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app.dSYM /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/CarNotify (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/CarNotify -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app.dSYM

AppIntentsSSUTraining (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Info.plist --temp-dir-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/ssu --bundle-id com.lath.carnotify --product-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app --extracted-metadata-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Metadata.appintents --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/CarNotify.build/Release-iphoneos/CarNotify.build/CarNotify.DependencyMetadataFileList --source-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app/Info.plist --archive-ssu-assets
2026-10-16 05:17:24.306 appintentsnltrainingprocessor[3874:15559] Parsing options for appintentsnltrainingprocessor
2026-10-16 05:17:24.306 appintentsnltrainingprocessor[3874:15559] Starting AppIntents SSU YAML Generation
2026-10-16 05:17:24.306 appintentsnltrainingprocessor[3874:15559] No AppShortcuts found - Skipping.

RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app

Validate /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    builtin-validationUtility /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app -shallow-bundle -infoplist-subpath Info.plist

Touch /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app (in target 'CarNotify' from project 'CarNotify')
    cd /Users/runner/work/carnovel/carnovel/CarNotify
    /usr/bin/touch -c /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/CarNotify.app

** BUILD SUCCEEDED **

```
