# GlassView 最后一次构建

- 结果: **success**
- 提交: `40cc1a52acebdd1e23e4f2cfc8e136de10540050`
- 时间: 2026-10-21 08:52:24 UTC

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
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/xcodebuild build -project GlassView.xcodeproj -scheme GlassView -configuration Release -sdk iphoneos -derivedDataPath /Users/runner/work/_temp/dd CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= CODE_SIGN_ENTITLEMENTS= ONLY_ACTIVE_ARCH=NO

Build settings from command line:
    CODE_SIGN_ENTITLEMENTS = 
    CODE_SIGN_IDENTITY = 
    CODE_SIGNING_ALLOWED = NO
    CODE_SIGNING_REQUIRED = NO
    ONLY_ACTIVE_ARCH = NO
    SDKROOT = iphoneos26.5

--- xcodebuild: WARNING: Using the first of multiple matching destinations:
{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
{ platform:macOS, arch:arm64, variant:Designed for [iPad,iPhone], id:bb8ca358c3eced5eaf0d3e3d2e43e0887ace81ce, name:My Mac }
{ platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS Simulator Device }
{ platform:visionOS Simulator, arch:arm64, variant:Designed for [iPad,iPhone], id:4950424B-607B-450B-B2C1-927AC1FE135F, OS:26.2, name:Apple Vision Pro }
{ platform:visionOS Simulator, arch:arm64, variant:Designed for [iPad,iPhone], id:DD9C9FB7-5D2F-4700-8C82-0CCBFCCE5BD5, OS:26.4.1, name:Apple Vision Pro }
{ platform:visionOS Simulator, arch:arm64, variant:Designed for [iPad,iPhone], id:2B46279C-932E-4A83-B6D6-3E0D08FEF9E3, OS:26.5, name:Apple Vision Pro }
{ platform:iOS Simulator, arch:arm64, id:872D3D92-89FC-49E7-8010-623AE992BE53, OS:26.2, name:iPad (A16) }
{ platform:iOS Simulator, arch:x86_64, id:872D3D92-89FC-49E7-8010-623AE992BE53, OS:26.2, name:iPad (A16) }
{ platform:iOS Simulator, arch:arm64, id:8140C7D4-B6A0-4208-AA08-0AE7E36A2ED7, OS:26.4.1, name:iPad (A16) }
{ platform:iOS Simulator, arch:x86_64, id:8140C7D4-B6A0-4208-AA08-0AE7E36A2ED7, OS:26.4.1, name:iPad (A16) }
{ platform:iOS Simulator, arch:arm64, id:1560A45E-C4D6-421A-B28D-D4CBB7AEB16E, OS:26.5, name:iPad (A16) }
{ platform:iOS Simulator, arch:x86_64, id:1560A45E-C4D6-421A-B28D-D4CBB7AEB16E, OS:26.5, name:iPad (A16) }
{ platform:iOS Simulator, arch:arm64, id:2762FE5F-7BDC-4FF4-85F9-128791DA7D70, OS:26.2, name:iPad Air 11-inch (M3) }
{ platform:iOS Simulator, arch:x86_64, id:2762FE5F-7BDC-4FF4-85F9-128791DA7D70, OS:26.2, name:iPad Air 11-inch (M3) }
{ platform:iOS Simulator, arch:arm64, id:8CF4EA9B-CFB4-4047-9579-50AE4D9C4C39, OS:26.4.1, name:iPad Air 11-inch (M4) }
{ platform:iOS Simulator, arch:x86_64, id:8CF4EA9B-CFB4-4047-9579-50AE4D9C4C39, OS:26.4.1, name:iPad Air 11-inch (M4) }
{ platform:iOS Simulator, arch:arm64, id:E3F295A2-F82D-4062-BD9F-3AC2D25771D0, OS:26.5, name:iPad Air 11-inch (M4) }
{ platform:iOS Simulator, arch:x86_64, id:E3F295A2-F82D-4062-BD9F-3AC2D25771D0, OS:26.5, name:iPad Air 11-inch (M4) }
{ platform:iOS Simulator, arch:arm64, id:61FD1CA6-0A9C-433D-9062-2A1905073F7B, OS:26.2, name:iPad Air 13-inch (M3) }
{ platform:iOS Simulator, arch:x86_64, id:61FD1CA6-0A9C-433D-9062-2A1905073F7B, OS:26.2, name:iPad Air 13-inch (M3) }
{ platform:iOS Simulator, arch:arm64, id:E9816C3D-670A-4099-A45C-A87E27AB0121, OS:26.4.1, name:iPad Air 13-inch (M4) }
{ platform:iOS Simulator, arch:x86_64, id:E9816C3D-670A-4099-A45C-A87E27AB0121, OS:26.4.1, name:iPad Air 13-inch (M4) }
{ platform:iOS Simulator, arch:arm64, id:5D2DEDEA-FD0F-444B-A6B4-462286B870CD, OS:26.5, name:iPad Air 13-inch (M4) }
{ platform:iOS Simulator, arch:x86_64, id:5D2DEDEA-FD0F-444B-A6B4-462286B870CD, OS:26.5, name:iPad Air 13-inch (M4) }
{ platform:iOS Simulator, arch:arm64, id:0C63C559-5513-4340-B1F8-C0ECD40308AF, OS:26.2, name:iPad Pro 11-inch (M5) }
{ platform:iOS Simulator, arch:x86_64, id:0C63C559-5513-4340-B1F8-C0ECD40308AF, OS:26.2, name:iPad Pro 11-inch (M5) }
{ platform:iOS Simulator, arch:arm64, id:8158498C-35D9-4CDD-A900-C765DCBF0935, OS:26.4.1, name:iPad Pro 11-inch (M5) }
{ platform:iOS Simulator, arch:x86_64, id:8158498C-35D9-4CDD-A900-C765DCBF0935, OS:26.4.1, name:iPad Pro 11-inch (M5) }
{ platform:iOS Simulator, arch:arm64, id:26F052CD-15B7-44B7-A129-B7135FDA1B92, OS:26.5, name:iPad Pro 11-inch (M5) }
{ platform:iOS Simulator, arch:x86_64, id:26F052CD-15B7-44B7-A129-B7135FDA1B92, OS:26.5, name:iPad Pro 11-inch (M5) }
{ platform:iOS Simulator, arch:arm64, id:3E32E66C-0037-43D0-BA3B-F54380A0040D, OS:26.2, name:iPad Pro 13-inch (M5) }
{ platform:iOS Simulator, arch:x86_64, id:3E32E66C-0037-43D0-BA3B-F54380A0040D, OS:26.2, name:iPad Pro 13-inch (M5) }
{ platform:iOS Simulator, arch:arm64, id:321980FC-BAC0-484D-B0AC-0C1D57FFC739, OS:26.4.1, name:iPad Pro 13-inch (M5) }
{ platform:iOS Simulator, arch:x86_64, id:321980FC-BAC0-484D-B0AC-0C1D57FFC739, OS:26.4.1, name:iPad Pro 13-inch (M5) }
{ platform:iOS Simulator, arch:arm64, id:99DEE653-946C-406D-8E9E-238D1FCE93C9, OS:26.5, name:iPad Pro 13-inch (M5) }
{ platform:iOS Simulator, arch:x86_64, id:99DEE653-946C-406D-8E9E-238D1FCE93C9, OS:26.5, name:iPad Pro 13-inch (M5) }
{ platform:iOS Simulator, arch:arm64, id:033003D3-045C-4334-9068-E7B1C2D3D6C5, OS:26.2, name:iPad mini (A17 Pro) }
{ platform:iOS Simulator, arch:x86_64, id:033003D3-045C-4334-9068-E7B1C2D3D6C5, OS:26.2, name:iPad mini (A17 Pro) }
{ platform:iOS Simulator, arch:arm64, id:1A931556-7569-452B-9276-C82E5224F9D5, OS:26.4.1, name:iPad mini (A17 Pro) }
{ platform:iOS Simulator, arch:x86_64, id:1A931556-7569-452B-9276-C82E5224F9D5, OS:26.4.1, name:iPad mini (A17 Pro) }
{ platform:iOS Simulator, arch:arm64, id:7EFEE255-C426-436B-A27B-3EC09FA8C9C0, OS:26.5, name:iPad mini (A17 Pro) }
{ platform:iOS Simulator, arch:x86_64, id:7EFEE255-C426-436B-A27B-3EC09FA8C9C0, OS:26.5, name:iPad mini (A17 Pro) }
{ platform:iOS Simulator, arch:arm64, id:600A45A3-B3A0-4A39-8A9C-5D051F9FDA9C, OS:26.2, name:iPhone 16e }
{ platform:iOS Simulator, arch:x86_64, id:600A45A3-B3A0-4A39-8A9C-5D051F9FDA9C, OS:26.2, name:iPhone 16e }
{ platform:iOS Simulator, arch:arm64, id:24E049C8-1AEC-4A9D-95C6-C11145A59D62, OS:26.2, name:iPhone 17 }
{ platform:iOS Simulator, arch:x86_64, id:24E049C8-1AEC-4A9D-95C6-C11145A59D62, OS:26.2, name:iPhone 17 }
{ platform:iOS Simulator, arch:arm64, id:6B80BA67-C6C4-428C-B622-38D6EED67050, OS:26.4.1, name:iPhone 17 }
{ platform:iOS Simulator, arch:x86_64, id:6B80BA67-C6C4-428C-B622-38D6EED67050, OS:26.4.1, name:iPhone 17 }
{ platform:iOS Simulator, arch:arm64, id:10B884BF-749F-4E8B-AFCD-26AB8F1DBD01, OS:26.5, name:iPhone 17 }
{ platform:iOS Simulator, arch:x86_64, id:10B884BF-749F-4E8B-AFCD-26AB8F1DBD01, OS:26.5, name:iPhone 17 }
{ platform:iOS Simulator, arch:arm64, id:B34C2F57-B98B-4C84-96E2-3170887BA2DB, OS:26.2, name:iPhone 17 Pro }
{ platform:iOS Simulator, arch:x86_64, id:B34C2F57-B98B-4C84-96E2-3170887BA2DB, OS:26.2, name:iPhone 17 Pro }
{ platform:iOS Simulator, arch:arm64, id:0183276C-C5F7-4A53-B0AF-C3D9117595F6, OS:26.4.1, name:iPhone 17 Pro }
{ platform:iOS Simulator, arch:x86_64, id:0183276C-C5F7-4A53-B0AF-C3D9117595F6, OS:26.4.1, name:iPhone 17 Pro }
{ platform:iOS Simulator, arch:arm64, id:E839A11B-51B4-4AD3-ACF4-A53B95B7C957, OS:26.5, name:iPhone 17 Pro }
{ platform:iOS Simulator, arch:x86_64, id:E839A11B-51B4-4AD3-ACF4-A53B95B7C957, OS:26.5, name:iPhone 17 Pro }
{ platform:iOS Simulator, arch:arm64, id:8B500E0C-CA36-4F12-853D-3B697FBEA084, OS:26.2, name:iPhone 17 Pro Max }
{ platform:iOS Simulator, arch:x86_64, id:8B500E0C-CA36-4F12-853D-3B697FBEA084, OS:26.2, name:iPhone 17 Pro Max }
{ platform:iOS Simulator, arch:arm64, id:E52F2A8A-51B6-409C-9C7B-9043B7E4A789, OS:26.4.1, name:iPhone 17 Pro Max }
{ platform:iOS Simulator, arch:x86_64, id:E52F2A8A-51B6-409C-9C7B-9043B7E4A789, OS:26.4.1, name:iPhone 17 Pro Max }
{ platform:iOS Simulator, arch:arm64, id:6EEDD2B9-6E06-4333-91B6-8661FDCCBA47, OS:26.5, name:iPhone 17 Pro Max }
{ platform:iOS Simulator, arch:x86_64, id:6EEDD2B9-6E06-4333-91B6-8661FDCCBA47, OS:26.5, name:iPhone 17 Pro Max }
{ platform:iOS Simulator, arch:arm64, id:49A10376-191D-4B27-82E7-4EC71948B0BB, OS:26.4.1, name:iPhone 17e }
{ platform:iOS Simulator, arch:x86_64, id:49A10376-191D-4B27-82E7-4EC71948B0BB, OS:26.4.1, name:iPhone 17e }
{ platform:iOS Simulator, arch:arm64, id:B645778B-2C95-4189-A74E-C79B9A17E245, OS:26.5, name:iPhone 17e }
{ platform:iOS Simulator, arch:x86_64, id:B645778B-2C95-4189-A74E-C79B9A17E245, OS:26.5, name:iPhone 17e }
{ platform:iOS Simulator, arch:arm64, id:3E8A6C6F-3253-4050-8CF7-715CB81ADF06, OS:26.2, name:iPhone Air }
{ platform:iOS Simulator, arch:x86_64, id:3E8A6C6F-3253-4050-8CF7-715CB81ADF06, OS:26.2, name:iPhone Air }
{ platform:iOS Simulator, arch:arm64, id:CB002ABF-49C1-4BBD-97EC-D3363B14BC06, OS:26.4.1, name:iPhone Air }
{ platform:iOS Simulator, arch:x86_64, id:CB002ABF-49C1-4BBD-97EC-D3363B14BC06, OS:26.4.1, name:iPhone Air }
{ platform:iOS Simulator, arch:arm64, id:726D52AF-426A-408A-974D-CA8B9BE8A479, OS:26.5, name:iPhone Air }
{ platform:iOS Simulator, arch:x86_64, id:726D52AF-426A-408A-974D-CA8B9BE8A479, OS:26.5, name:iPhone Air }
note: Using codesigning identity override: 
ComputePackagePrebuildTargetDependencyGraph

Prepare packages

CreateBuildRequest

SendProjectDescription

CreateBuildOperation

ComputeTargetDependencyGraph
note: Building targets in dependency order
note: Target dependency graph (2 targets)
    Target 'GlassView' in project 'GlassView'
        ➜ Explicit dependency on target 'GlassViewWidget' in project 'GlassView'
    Target 'GlassViewWidget' in project 'GlassView' (no dependencies)

GatherProvisioningInputs

CreateBuildDescription

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc --version

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --print-asset-tag-combinations --output-format xml1 /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Assets.xcassets

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld -version_details

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --version --output-format xml1

Build description signature: 6ffcb48c31dbe118177207410e7a7b16
Build description path: /Users/runner/work/_temp/dd/Build/Intermediates.noindex/XCBuildData/6ffcb48c31dbe118177207410e7a7b16.xcbuilddata
CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex

ClangStatCache /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -o /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView-208281cae45f13e2b0a992806eacf7ae-VFS-iphoneos/all-product-headers.yaml
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView-208281cae45f13e2b0a992806eacf7ae-VFS-iphoneos/all-product-headers.yaml

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/GlassView/GlassView.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_const_extract_protocols.json (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_const_extract_protocols.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftFileList (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftConstValuesFileList (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.LinkFileList (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.LinkFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-OutputFileMap.json (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-OutputFileMap.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.hmap (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyStaticMetadataFileList (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyMetadataFileList (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-project-headers.hmap (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-project-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-own-target-headers.hmap (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-own-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-generated-files.hmap (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-generated-files.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-target-headers.hmap (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-non-framework-target-headers.hmap (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-non-framework-target-headers.hmap

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_const_extract_protocols.json (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_const_extract_protocols.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftFileList (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftConstValuesFileList (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.LinkFileList (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.LinkFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-OutputFileMap.json (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-OutputFileMap.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.hmap (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyStaticMetadataFileList (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyMetadataFileList (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-project-headers.hmap (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-project-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-own-target-headers.hmap (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-own-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-generated-files.hmap (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-generated-files.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-target-headers.hmap (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-non-framework-target-headers.hmap (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-non-framework-target-headers.hmap

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app

ProcessInfoPlistFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/Info.plist /Users/runner/work/carnovel/carnovel/GlassView/GlassViewWidget/Info.plist (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-infoPlistUtility /Users/runner/work/carnovel/carnovel/GlassView/GlassViewWidget/Info.plist -producttype com.apple.product-type.app-extension -expandbuildsettings -format binary -platform iphoneos -requiredArchitecture arm64 -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/Info.plist

SwiftDriver GlassViewWidget normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-SwiftDriver -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassViewWidget -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -application-extension -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassView -no-emit-module-separately-wmo

SwiftDriver\ Compilation GlassViewWidget normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-Swift-Compilation -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassViewWidget -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -application-extension -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassView -no-emit-module-separately-wmo

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-4C6LBU7PTHAV6XC2QLPREP69X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-3FZZTSIUBUA1KRORHZKMYA6VQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7DTPA61KKGBW4ULZIJYQITHOI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-B282392CGKFWCLEMKPGBTV9RD.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-9O1XU7Q5T845GJNQSHDTOE5Y5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-OYG5GWQQG98K5SCN8TWKER6A.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-7REJB1J1WIDJBYORAL310OUTP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-8XKF6NRL15JSCFDYBOKVSRVRZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-D26T7JY0YLDHXDYICB4IV03D4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-1T26EUKOT96UMXDBPK5WVJ5GC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-1HSH21VSSPEEKBPQCO08IHSWX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-8AD14FXKH5RY5UEAVSZ26EVSM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-5JJH98BE2POEE10TSBJMR5XPX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-1SQ8MTXCDSUIRURUH3SH0FL82.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-BLY24VSMOFYN14L73VYQ2T2N.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-ASDKUYB82TRKRGU4OBT9CK7TI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-5RYPN57NCL09KD8F962KKDOEI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-E8PGPLXSHMEJC7K1LX6T5TUPB.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-633N89HT1O8CKTP2JVAO98EWW.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-A6SCEM0PLEVYT5BASYAPJY8IO.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-CV6YCR5UIHDDISWQVNMJQMZKR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-6DXZO0M5ET5ZOSOS9FV0G581T.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-32LCKZSQ1O7A2S2RQXB8EHUT5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-CI3CAIUHQ455ARMT0CN4WFM4G.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-BF8OQT15SY9387GOKAE9SEEAY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-41WZQLBZAQI2AVMW1QSXOKZ3.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-7ZX5LVQIDC9082A7LN2LRG9BW.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-2N28DDU1KNYN1XO225Q6BRA2A.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-ZSL4QP4A8SIJTEYGE8N5NCCI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-8VEQKT6YFNRYF47YQJUB6ZWUT.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-BZMSSM5GZM2KF6JO4T8FXEOIV.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-48COXUJ3I4QJN37G8UVVVM2Q5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-F4UKG8WCZCP800CTXI2ZNOAE4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-EX9EZAL4G6ZM7VUECJ3ZPG52R.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-AKWNTZNSAOO24EZIRBR846CAN.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-5ESYDT8UYIYNGQD9QFV2XYEVS.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os-351KUTMBKNPOOZ6PBGYK44HAX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-2OJBINBS0H38IB24I56EIILAK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-6GK65I3EUBH6K6SRCEKGXDMNK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-A9HV16ZZOS1G5C2NP6W20RAZ6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-17DG0JNI3TVJJM6RRMN5YCZKX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-B57A5N390NI3ODKTSUFKI3TH8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-DY1R7VQ92R4PJTQ8ICLPOPTMC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-3B7L4E4L0V6JYHTRGWC582KUR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-60Y2QACUXR53HTE75XJRTVR3Q.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-8K6G286SEW15UOKGDFDBVDPY1.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-EJPE7LKZXDRJCQM3VYKY0LRXK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-8GAXMQPMBOAEQT1GI2ZRJWG5X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-3XOWTJWNP5CC30E57TNMWDGS8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-DWBBPWFQSZBVK8TJUBK1IDT6K.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-2OV7QSMSB36423IAZRULJWI26.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-7W90HYLVIW6N65T43YHM541XM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-96CWJG1LJ41B54064I1CO5NA4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-DVUCIH10JO1LCQWD1PH199DZJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-56VN40UMHNNBA8TLN1NVOHBMK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-273S5334UBGYO8SF0JC5FO5ON.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-8TWSRBOGTUQWATDK4N9XYV3GG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-AZXYTXI2IW8VMC804GXX4P0X0.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-745HAB3QPD91O83ZTWWRDPEZ6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-C69TAMZEHGR1UMK39UNOUTA3U.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-460UUEDFYXO79D6WP6DT9FEUD.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-511PVCLEUU2F0WEWB7DV4PK9H.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-9MWA2NJP73XMZ3PHQ4Z77X0G5.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-CMW1YJCG2PVXDFSR9N6UZK2F9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ERTG8D0CCSVBUVNGSGLLL86E4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-2APT02150FYBDJRU4KKKL52JE.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-7RU5NPBTALAWVZW34GYD3B0UN.pcm

SwiftCompile normal arm64 Compiling\ GlassViewWidget.swift,\ NotificationActivityAttributes.swift,\ NotificationLiveActivity.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassViewWidget/GlassViewWidget.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Shared/NotificationActivityAttributes.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassViewWidget/NotificationLiveActivity.swift /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Concurrency.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Intents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/OSLog.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Symbols.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreSpotlight.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DataDetection.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Foundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Distributed.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation1.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Darwin.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/os.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/RelevanceKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Swift.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UniformTypeIdentifiers.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation2.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Combine.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Spatial.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/simd.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AppIntents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreTransferable.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreGraphics.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/QuartzCore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUICore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ExtensionFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_StringProcessing.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Metal.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Network.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Accessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation3.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreText.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreLocation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ActivityKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DeveloperToolsSupport.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Observation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_AppIntents_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/WidgetKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreImage.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/System.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LightweightCodeRequirements.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Builtin_float.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/FileProvider.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Dispatch.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreVideo.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UIKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ObjectiveC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/XPC.swiftmodule/arm64e-apple-ios.swiftmodule /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-ASDKUYB82TRKRGU4OBT9CK7TI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-48COXUJ3I4QJN37G8UVVVM2Q5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-96CWJG1LJ41B54064I1CO5NA4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7DTPA61KKGBW4ULZIJYQITHOI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-9MWA2NJP73XMZ3PHQ4Z77X0G5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-6DXZO0M5ET5ZOSOS9FV0G581T.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-3B7L4E4L0V6JYHTRGWC582KUR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-1SQ8MTXCDSUIRURUH3SH0FL82.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-1T26EUKOT96UMXDBPK5WVJ5GC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-3FZZTSIUBUA1KRORHZKMYA6VQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-460UUEDFYXO79D6WP6DT9FEUD.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-C69TAMZEHGR1UMK39UNOUTA3U.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-BLY24VSMOFYN14L73VYQ2T2N.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-2N28DDU1KNYN1XO225Q6BRA2A.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-BF8OQT15SY9387GOKAE9SEEAY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-OYG5GWQQG98K5SCN8TWKER6A.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-B57A5N390NI3ODKTSUFKI3TH8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-AZXYTXI2IW8VMC804GXX4P0X0.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-E8PGPLXSHMEJC7K1LX6T5TUPB.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-DVUCIH10JO1LCQWD1PH199DZJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-A9HV16ZZOS1G5C2NP6W20RAZ6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-2OV7QSMSB36423IAZRULJWI26.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-60Y2QACUXR53HTE75XJRTVR3Q.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-CI3CAIUHQ455ARMT0CN4WFM4G.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-273S5334UBGYO8SF0JC5FO5ON.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-745HAB3QPD91O83ZTWWRDPEZ6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-7W90HYLVIW6N65T43YHM541XM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-3XOWTJWNP5CC30E57TNMWDGS8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-CV6YCR5UIHDDISWQVNMJQMZKR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-5ESYDT8UYIYNGQD9QFV2XYEVS.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-5JJH98BE2POEE10TSBJMR5XPX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os-351KUTMBKNPOOZ6PBGYK44HAX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-BZMSSM5GZM2KF6JO4T8FXEOIV.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-1HSH21VSSPEEKBPQCO08IHSWX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-8AD14FXKH5RY5UEAVSZ26EVSM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-4C6LBU7PTHAV6XC2QLPREP69X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-633N89HT1O8CKTP2JVAO98EWW.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-2OJBINBS0H38IB24I56EIILAK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-8VEQKT6YFNRYF47YQJUB6ZWUT.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ERTG8D0CCSVBUVNGSGLLL86E4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-AKWNTZNSAOO24EZIRBR846CAN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-A6SCEM0PLEVYT5BASYAPJY8IO.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-8TWSRBOGTUQWATDK4N9XYV3GG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-7REJB1J1WIDJBYORAL310OUTP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-8XKF6NRL15JSCFDYBOKVSRVRZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-41WZQLBZAQI2AVMW1QSXOKZ3.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-56VN40UMHNNBA8TLN1NVOHBMK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-32LCKZSQ1O7A2S2RQXB8EHUT5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-5RYPN57NCL09KD8F962KKDOEI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-9O1XU7Q5T845GJNQSHDTOE5Y5.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-7ZX5LVQIDC9082A7LN2LRG9BW.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-8K6G286SEW15UOKGDFDBVDPY1.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-EX9EZAL4G6ZM7VUECJ3ZPG52R.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-B282392CGKFWCLEMKPGBTV9RD.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-EJPE7LKZXDRJCQM3VYKY0LRXK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-511PVCLEUU2F0WEWB7DV4PK9H.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-2APT02150FYBDJRU4KKKL52JE.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-CMW1YJCG2PVXDFSR9N6UZK2F9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-ZSL4QP4A8SIJTEYGE8N5NCCI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-8GAXMQPMBOAEQT1GI2ZRJWG5X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-6GK65I3EUBH6K6SRCEKGXDMNK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-D26T7JY0YLDHXDYICB4IV03D4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-DY1R7VQ92R4PJTQ8ICLPOPTMC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-17DG0JNI3TVJJM6RRMN5YCZKX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-F4UKG8WCZCP800CTXI2ZNOAE4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-7RU5NPBTALAWVZW34GYD3B0UN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-DWBBPWFQSZBVK8TJUBK1IDT6K.pcm /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-dependencies-1.json (in target 'GlassViewWidget' from project 'GlassView')

CompileSwift normal arm64 (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    

SwiftDriverJobDiscovery normal arm64 Compiling GlassViewWidget.swift, NotificationActivityAttributes.swift, NotificationLiveActivity.swift (in target 'GlassViewWidget' from project 'GlassView')

SwiftDriver\ Compilation\ Requirements GlassViewWidget normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassViewWidget -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -application-extension -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassView -no-emit-module-separately-wmo

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/arm64-apple-ios.swiftmodule /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftmodule (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftmodule /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/arm64-apple-ios.swiftdoc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftdoc (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftdoc /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/arm64-apple-ios.swiftdoc

SwiftMergeGeneratedHeaders /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources/GlassViewWidget-Swift.h /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-Swift.h (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-swiftHeaderTool -arch arm64 /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-Swift.h -o /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/DerivedSources/GlassViewWidget-Swift.h

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/arm64-apple-ios.abi.json /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.abi.json (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.abi.json /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftsourceinfo (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

Ld /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/GlassViewWidget normal (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios18.0 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -Os -L/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -L/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -filelist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.LinkFileList -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -rpath -Xlinker @executable_path/../../Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_lto.o -Xlinker -dependency_info -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_dependency_info.dat -e _NSExtensionMain -fapplication-extension -fobjc-link-runtime -L/Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.swiftmodule @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget-linker-args.resp -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/GlassViewWidget

MkDir /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/thinned (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/thinned

MkDir /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/unthinned (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/unthinned

GenerateAssetSymbols /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Assets.xcassets (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Assets.xcassets --compile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app --output-format human-readable-text --notices --warnings --export-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_dependencies --output-partial-info-plist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist --app-icon AppIcon --compress-pngs --enable-on-demand-resources YES --development-region en --target-device iphone --minimum-deployment-target 18.0 --platform iphoneos --bundle-identifier com.lath.glassview --generate-swift-asset-symbol-extensions NO --generate-swift-asset-symbols /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols.swift --generate-objc-asset-symbols /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols.h --generate-asset-symbol-index /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols-Index.plist
/* com.apple.actool.compilation-results */
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols-Index.plist
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols.h
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols.swift


CompileAssetCatalogVariant thinned /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Assets.xcassets (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Assets.xcassets --compile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/thinned --output-format human-readable-text --notices --warnings --export-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_dependencies_thinned --output-partial-info-plist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist_thinned --app-icon AppIcon --compress-pngs --enable-on-demand-resources YES --development-region en --target-device iphone --minimum-deployment-target 18.0 --platform iphoneos
/* com.apple.actool.compilation-results */
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist_thinned
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/thinned/AppIcon60x60@2x.png
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/thinned/Assets.car


GenerateDSYMFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex.dSYM /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/GlassViewWidget (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/GlassViewWidget -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex.dSYM

ExtractAppIntentsMetadata (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.kZyRFM/Metal.xctoolchain --module-name GlassViewWidget --sdk-root /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 18.0 --bundle-identifier com.lath.glassview.widget --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex --target-triple arm64-apple-ios18.0 --binary-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/GlassViewWidget --dependency-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget_dependency_info.dat --stringsdata-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftFileList --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyMetadataFileList --static-metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyStaticMetadataFileList --swift-const-vals-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/Objects-normal/arm64/GlassViewWidget.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-10-21 08:52:00.186 appintentsmetadataprocessor[1753:8561] Starting appintentsmetadataprocessor export
2026-10-21 08:52:00.250 appintentsmetadataprocessor[1753:8561] Writing Metadata.appintents
2026-10-21 08:52:00.250 appintentsmetadataprocessor[1753:8561] Metadata root: /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/Metadata.appintents

AppIntentsSSUTraining (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/Info.plist --temp-dir-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/ssu --bundle-id com.lath.glassview.widget --product-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex --extracted-metadata-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/Metadata.appintents --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassViewWidget.build/GlassViewWidget.DependencyMetadataFileList --source-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex/Info.plist --archive-ssu-assets
2026-10-21 08:52:00.290 appintentsnltrainingprocessor[1766:8595] Parsing options for appintentsnltrainingprocessor
2026-10-21 08:52:00.290 appintentsnltrainingprocessor[1766:8595] Starting AppIntents SSU YAML Generation
2026-10-21 08:52:00.307 appintentsnltrainingprocessor[1766:8595] No AppShortcuts found - Skipping.

RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex

Touch /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex (in target 'GlassViewWidget' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /usr/bin/touch -c /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex

CpResource /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/rtos.wasm /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Pkg/rtos.wasm (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Pkg/rtos.wasm /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app

CpResource /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/index.html /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Pkg/index.html (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Pkg/index.html /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app

SwiftDriver GlassView normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-SwiftDriver -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassView -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassView -no-emit-module-separately-wmo

SwiftDriver\ Compilation GlassView normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-Swift-Compilation -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassView -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassView -no-emit-module-separately-wmo

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-E1LNGX12II2VGQC3T5IRTF1L.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-6LTKT6G2T4QJJ5WT8RYINZP5H.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-9HAKQ8RW8U11HG4YX4VC45O7H.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-EHSIDUR2LNY2JYRSYLGGSYB2D.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/LocalAuthentication-3N23IL8ZKRS277BU1G462CEAP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-BPNECTK3MPXQG4WOSUR3NKCU6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-ACEXB0PPYHQ00EUIIIZU4X671.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-6HT9KPLP2HX8TC95E4UNAAMQV.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaAccessibility-DWESJ4K50PTGYP0E50JV7M1W9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-DJL8OAP6SBMDEHNOIHKUS5JKM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-EBGVGKRIZIXZUXX0JH789I98B.pcm

LinkAssetCatalog /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Assets.xcassets (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-linkAssetCatalog --thinned /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/thinned --thinned-dependencies /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_dependencies_thinned --thinned-info-plist-content /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist_thinned --unthinned /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_output/unthinned --unthinned-dependencies /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_dependencies_unthinned --unthinned-info-plist-content /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist_unthinned --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app --plist-output /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist
note: Emplaced /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Assets.car (in target 'GlassView' from project 'GlassView')
note: Emplaced /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/AppIcon60x60@2x.png (in target 'GlassView' from project 'GlassView')

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVKit-8NVRAUH8TX1ZK5NCYJZEAG9ZB.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm

SwiftCompile normal arm64 Compiling\ BackgroundKeepAlive.swift,\ ContentView.swift,\ GlassViewApp.swift,\ NotificationActivityAttributes.swift,\ NotifyServer.swift,\ GeneratedAssetSymbols.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassView/BackgroundKeepAlive.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassView/UI/ContentView.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassView/App/GlassViewApp.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Shared/NotificationActivityAttributes.swift /Users/runner/work/carnovel/carnovel/GlassView/GlassView/NotifyServer.swift /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GeneratedAssetSymbols.swift /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMedia.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Concurrency.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Intents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/OSLog.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Synchronization.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AudioToolbox.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Symbols.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreSpotlight.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Foundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DataDetection.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Distributed.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation1.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Darwin.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/os.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UniformTypeIdentifiers.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/RelevanceKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation2.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Spatial.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Combine.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/simd.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AppIntents.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Swift.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreTransferable.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreGraphics.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMIDI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LocalAuthentication.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/QuartzCore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_AVKit_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUICore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ExtensionFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_StringProcessing.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Network.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Metal.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/TipKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Accessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation3.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreText.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreLocation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ActivityKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DeveloperToolsSupport.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Observation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_AppIntents_SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/WidgetKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreImage.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/System.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LightweightCodeRequirements.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Builtin_float.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/FileProvider.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Dispatch.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreVideo.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/MediaAccessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UIKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CryptoKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ObjectiveC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/XPC.swiftmodule/arm64e-apple-ios.swiftmodule /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Intents-DJL8OAP6SBMDEHNOIHKUS5JKM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVKit-8NVRAUH8TX1ZK5NCYJZEAG9ZB.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaAccessibility-DWESJ4K50PTGYP0E50JV7M1W9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/WidgetKit-9HAKQ8RW8U11HG4YX4VC45O7H.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ActivityKit-E1LNGX12II2VGQC3T5IRTF1L.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_LocationEssentials-EHSIDUR2LNY2JYRSYLGGSYB2D.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreLocation-BPNECTK3MPXQG4WOSUR3NKCU6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ExtensionFoundation-6LTKT6G2T4QJJ5WT8RYINZP5H.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/RelevanceKit-ACEXB0PPYHQ00EUIIIZU4X671.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AppIntents-6HT9KPLP2HX8TC95E4UNAAMQV.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreSpotlight-EBGVGKRIZIXZUXX0JH789I98B.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/LocalAuthentication-3N23IL8ZKRS277BU1G462CEAP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-dependencies-1.json (in target 'GlassView' from project 'GlassView')

CompileSwift normal arm64 (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    

SwiftDriverJobDiscovery normal arm64 Compiling BackgroundKeepAlive.swift, ContentView.swift, GlassViewApp.swift, NotificationActivityAttributes.swift, NotifyServer.swift, GeneratedAssetSymbols.swift (in target 'GlassView' from project 'GlassView')

SwiftDriver\ Compilation\ Requirements GlassView normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassView -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassView -no-emit-module-separately-wmo

SwiftMergeGeneratedHeaders /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GlassView-Swift.h /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-Swift.h (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-swiftHeaderTool -arch arm64 /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-Swift.h -o /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/DerivedSources/GlassView-Swift.h

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/arm64-apple-ios.swiftdoc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftdoc (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftdoc /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/arm64-apple-ios.swiftdoc

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/arm64-apple-ios.swiftmodule /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftmodule (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftmodule /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/arm64-apple-ios.abi.json /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.abi.json (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.abi.json /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftsourceinfo (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

Ld /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/GlassView normal (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios18.0 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -Os -L/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -L/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -filelist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.LinkFileList -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_lto.o -Xlinker -dependency_info -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_dependency_info.dat -fobjc-link-runtime -L/Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.swiftmodule @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView-linker-args.resp -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/GlassView

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns/GlassViewWidget.appex /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -exclude Headers -exclude PrivateHeaders -exclude Modules -exclude \*.tbd -resolve-src-symlinks -remove-static-executable /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassViewWidget.appex /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns

ProcessInfoPlistFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Info.plist /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Info.plist (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-infoPlistUtility /Users/runner/work/carnovel/carnovel/GlassView/GlassView/Info.plist -producttype com.apple.product-type.application -genpkginfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PkgInfo -expandbuildsettings -format binary -platform iphoneos -additionalcontentfile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/assetcatalog_generated_info.plist -scanforprivacyfile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns/GlassViewWidget.appex -requiredArchitecture arm64 -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Info.plist

ExtractAppIntentsMetadata (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.kZyRFM/Metal.xctoolchain --module-name GlassView --sdk-root /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 18.0 --bundle-identifier com.lath.glassview --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app --target-triple arm64-apple-ios18.0 --binary-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/GlassView --dependency-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView_dependency_info.dat --stringsdata-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftFileList --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyMetadataFileList --static-metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyStaticMetadataFileList --swift-const-vals-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/Objects-normal/arm64/GlassView.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-10-21 08:52:20.349 appintentsmetadataprocessor[2485:10507] Starting appintentsmetadataprocessor export
2026-10-21 08:52:20.375 appintentsmetadataprocessor[2485:10507] Extracted no relevant App Intents symbols, skipping writing output

CopySwiftLibs /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-swiftStdLibTool --copy --verbose --scan-executable /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/GlassView --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Frameworks --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/SystemExtensions --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Extensions --platform iphoneos --toolchain /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.kZyRFM/Metal.xctoolchain --toolchain /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --destination /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Frameworks --strip-bitcode --strip-bitcode-tool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/bitcode_strip --emit-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/SwiftStdLibToolInputDependencies.dep --filter-for-swift-os --back-deploy-swift-span
Ignoring --strip-bitcode because --sign was not passed

ValidateEmbeddedBinary /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns/GlassViewWidget.appex (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/embeddedBinaryValidationUtility /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/PlugIns/GlassViewWidget.appex -info-plist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Info.plist

GenerateDSYMFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app.dSYM /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/GlassView (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/GlassView -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app.dSYM

AppIntentsSSUTraining (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Info.plist --temp-dir-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/ssu --bundle-id com.lath.glassview --product-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app --extracted-metadata-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Metadata.appintents --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassView.build/Release-iphoneos/GlassView.build/GlassView.DependencyMetadataFileList --source-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app/Info.plist --archive-ssu-assets
2026-10-21 08:52:20.542 appintentsnltrainingprocessor[2492:10523] Parsing options for appintentsnltrainingprocessor
2026-10-21 08:52:20.543 appintentsnltrainingprocessor[2492:10523] Starting AppIntents SSU YAML Generation
2026-10-21 08:52:20.543 appintentsnltrainingprocessor[2492:10523] No AppShortcuts found - Skipping.

RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app

Validate /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    builtin-validationUtility /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app -shallow-bundle -infoplist-subpath Info.plist

Touch /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app (in target 'GlassView' from project 'GlassView')
    cd /Users/runner/work/carnovel/carnovel/GlassView
    /usr/bin/touch -c /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassView.app

** BUILD SUCCEEDED **

```
