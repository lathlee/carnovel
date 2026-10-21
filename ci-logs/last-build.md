# GlassNotify 最后一次构建

- 结果: **success**
- 提交: `342a58b1a5ac14dda29366e088ea6168569caea9`
- 时间: 2026-10-21 08:24:34 UTC

## 错误摘要

```
```

## 完整日志（末尾 2500 行）

```
Command line invocation:
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/xcodebuild build -project GlassNotify.xcodeproj -scheme GlassNotify -configuration Release -sdk iphoneos -derivedDataPath /Users/runner/work/_temp/dd CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= CODE_SIGN_ENTITLEMENTS= ONLY_ACTIVE_ARCH=NO

Build settings from command line:
    CODE_SIGN_ENTITLEMENTS = 
    CODE_SIGN_IDENTITY = 
    CODE_SIGNING_ALLOWED = NO
    CODE_SIGNING_REQUIRED = NO
    ONLY_ACTIVE_ARCH = NO
    SDKROOT = iphoneos26.5

--- xcodebuild: WARNING: Using the first of multiple matching destinations:
{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
{ platform:macOS, arch:arm64, variant:Designed for [iPad,iPhone], id:c77e2b5765439e31052cfdd773c0cd32eeb245cf, name:My Mac }
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
note: Target dependency graph (1 target)
    Target 'GlassNotify' in project 'GlassNotify' (no dependencies)

GatherProvisioningInputs

CreateBuildDescription

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --print-asset-tag-combinations --output-format xml1 /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Assets.xcassets

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --version --output-format xml1

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc --version

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld -version_details

Build description signature: 641b09900b3d7e3b52c76139570b71f4
Build description path: /Users/runner/work/_temp/dd/Build/Intermediates.noindex/XCBuildData/641b09900b3d7e3b52c76139570b71f4.xcbuilddata
ClangStatCache /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-stat-cache /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -o /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify-c45e50a495fc43bbae581be4a5926cf0-VFS-iphoneos/all-product-headers.yaml
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify-c45e50a495fc43bbae581be4a5926cf0-VFS-iphoneos/all-product-headers.yaml

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/ExplicitPrecompiledModules

CreateBuildDirectory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos
    cd /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify.xcodeproj
    builtin-create-build-directory /Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_const_extract_protocols.json (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_const_extract_protocols.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftFileList (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftConstValuesFileList (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftConstValuesFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.LinkFileList (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.LinkFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-OutputFileMap.json (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-OutputFileMap.json

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.hmap (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyStaticMetadataFileList (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyStaticMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyMetadataFileList (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyMetadataFileList

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-project-headers.hmap (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-project-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-own-target-headers.hmap (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-own-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-generated-files.hmap (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-generated-files.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-target-headers.hmap (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-target-headers.hmap

WriteAuxiliaryFile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-non-framework-target-headers.hmap (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    write-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-non-framework-target-headers.hmap

MkDir /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app

MkDir /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/thinned (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/thinned

MkDir /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/unthinned (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /bin/mkdir -p /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/unthinned

GenerateAssetSymbols /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Assets.xcassets (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Assets.xcassets --compile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app --output-format human-readable-text --notices --warnings --export-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_dependencies --output-partial-info-plist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist --app-icon AppIcon --compress-pngs --enable-on-demand-resources YES --development-region en --target-device iphone --minimum-deployment-target 18.0 --platform iphoneos --bundle-identifier com.lath.glassnotify --generate-swift-asset-symbol-extensions NO --generate-swift-asset-symbols /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols.swift --generate-objc-asset-symbols /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols.h --generate-asset-symbol-index /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols-Index.plist
/* com.apple.actool.compilation-results */
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols-Index.plist
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols.h
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols.swift


CompileAssetCatalogVariant thinned /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Assets.xcassets (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Assets.xcassets --compile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/thinned --output-format human-readable-text --notices --warnings --export-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_dependencies_thinned --output-partial-info-plist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist_thinned --app-icon AppIcon --compress-pngs --enable-on-demand-resources YES --development-region en --target-device iphone --minimum-deployment-target 18.0 --platform iphoneos
/* com.apple.actool.compilation-results */
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist_thinned
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/thinned/AppIcon60x60@2x.png
/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/thinned/Assets.car


SwiftDriver GlassNotify normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-SwiftDriver -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassNotify -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassNotify -no-emit-module-separately-wmo

SwiftDriver\ Compilation GlassNotify normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-Swift-Compilation -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassNotify -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassNotify -no-emit-module-separately-wmo

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/LocalAuthentication-3N23IL8ZKRS277BU1G462CEAP.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm

SwiftExplicitDependencyGeneratePcm arm64 /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm

SwiftCompile normal arm64 Compiling\ BackgroundKeepAlive.swift,\ ContentView.swift,\ GlassNotifyApp.swift,\ NotifyServer.swift,\ GeneratedAssetSymbols.swift /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/BackgroundKeepAlive.swift /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/UI/ContentView.swift /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/App/GlassNotifyApp.swift /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/NotifyServer.swift /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GeneratedAssetSymbols.swift /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Darwin.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Accessibility.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/ObjectiveC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/System.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Distributed.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Network.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UniformTypeIdentifiers.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/UIKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Spatial.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation1.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreData.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/LocalAuthentication.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Observation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation2.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Combine.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_DarwinFoundation3.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AVFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Swift.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Metal.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/SwiftUICore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreFoundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreVideo.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CryptoKit.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/simd.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/AudioToolbox.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreText.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DeveloperToolsSupport.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Dispatch.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreAudio.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreTransferable.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/FileProvider.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Foundation.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/OSLog.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Concurrency.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Symbols.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMedia.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_StringProcessing.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/XPC.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/QuartzCore.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/os.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreMIDI.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/_Builtin_float.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/DataDetection.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/Synchronization.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreImage.swiftmodule/arm64e-apple-ios.swiftmodule /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/prebuilt-modules/26.5/CoreGraphics.swiftmodule/arm64e-apple-ios.swiftmodule /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMedia-FBH31AWG7HPTXTMZW7Q7C3CS.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Network-7WAIBCBXJG8ZD7S1Y0RRPXIGY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_tgmath-C13QTAMQK1IRN5CUPN81TCGGP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stddef-1OLFHJKBMLLBSJ9CNR38Q32WM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Dispatch-1PCTTQ4RL5JF4H1JJ5ZR3QP4I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/FileProvider-8GSC9KGEM1PLSPT8WR1VFAS2O.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os-F1902MBH118VP3Y51WHT36IKG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_limits-K17DU31HEKPIBLY2F3GIAJXK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UniformTypeIdentifiers-9PLE3NN0QM7OVYW8B16JT4FSQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Security-AAIT8LUEP9R34HJITM58JWIKK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/XPC-2LR3NFSXWGG4HCSB7GP7MJQT9.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ObjectiveC-532ES28E15T52VC0V9OGG1Y97.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_SwiftConcurrencyShims-9AE4DAUYKF682PWS9AM5N6MLZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UserNotifications-36UWNE93ZPLKUE649FRAMUE.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFAudio-16QMG3UZ2SGM3DQBXG65Q8S0U.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Accessibility-5T3VXXJ54MRI3IGHH4KH7CJJZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OSLog-5N15O6DRQQ0DDNOB8HFQA1X71.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CFNetwork-29YLQQCBVS7BA95QB1RS9QCPZ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MachO-56Y08DMBT4N9R6JX2WRIUYUIY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_inttypes-2R9BKW5AKSNBYY2PDJL8YQ5C2.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Darwin-ATGCRW6UVH36TJ2PAAC9GQJ87.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdarg-7VJDC0LF9BOWP15M6KYBUY5UJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreFoundation-2OUUVC731DK3KJWVN79KVFN1X.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrauth-3JW4VV69235UYPQAU1Y9GSBLN.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIKit-ENZZCUIKNP1JE8HQNDLEDX385.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreGraphics-BU3OY6UKNF3IQAF3LWCVOVL0Y.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation2-8U51WUYVZPU5B3OJAKOA8HXEK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Metal-P5TCWM12H5WTL9QEDJ1SOODC.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation3-2K9GHQ5QGLJEGP0IZSNB3FFZT.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_DarwinFoundation1-3RTNT9RWVVOI21BQTM2NRGJRY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreTransferable-3K8UQ6LT6JQ6ZTT82HS5B4GTG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Symbols-DEG4KD7FMPM4BWNYIRA8HPVQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_intrinsics-1IW2XH7JCH3NDQW0JEY8R8Q70.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudio-CQZC0DEZL7Y1C20ACVBE00EWJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdbool-D76COSQZ1DODGKRXK8TFISAMA.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreText-1QAKH3E0SL2F1VBFGVFUPA8AF.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/QuartzCore-HRDNOX9P3FRTKQVEX88C483P.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftShims-25J99BT6GN0E82BY0PHW6HXC8.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/dnssd-7AWUHGBLVLPEQAFG4OEO9AVST.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUI-DRQ57RJKI84SUAOP55Q2W2ZCK.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_workgroup-DUE2EWLAZZYA2NUWDQTPAQY4.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/os_object-56HN07FEBZGTO9H8T2WMD1U79.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Spatial-7V1ESMQYY6D6OMKL04HWOLBHH.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_float-AQMXUP5O3BGHPGG6K7SSWCLNJ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/sys_types-B06XLAHXF7GK8U4LLYDIOJ84L.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DeveloperToolsSupport-ACCIBO7KR77O8Y4ZGGMHL8Q4Q.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ImageIO-CKS1UJN2RVA5PW3E3HKEBN8ZG.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/IOSurface-F33DAMST5TF0HTQ8YJNPOH0JI.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/LocalAuthentication-3N23IL8ZKRS277BU1G462CEAP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreMIDI-9ABARRYCSPP8QHKQC5ZSOIKGQ.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/MediaToolbox-BMMPRH44QZ3D8OR8770DAZGYX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVRouting-2SEV6PIJ6UL3JTZHAUORR2J5I.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreData-CPW44149DCP3L11M8RUU2EVQY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_AvailabilityInternal-EE5DZEL6UAY4XUTOINJY4US6J.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreVideo-4IW0CM7VDX0Q1N2SB7AU2WM0D.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/SwiftUICore-ESPZ4HUVQU7S6UIVTCDAISE0K.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/UIUtilities-DC50NXK2IAPRLFYJUFNLOJUJX.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdint-AOA27QZ2DADCJY35BMAL8DYFY.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/simd-9K6MS2LCUZ8U695C74G20BJVR.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AudioToolbox-3DJ0FWS8CU1MR8A0GORPSZPY6.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/AVFoundation-2LTP3Z0HJRPI7NMJFLVWA0MCM.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/Foundation-A6SOLY2RKYNJQC9DS7MH1PQM1.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreImage-772Z8BZB6BRFL1W5H3EJEL121.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/_Builtin_stdatomic-DQMTWWBBSG0KEU3J1DTZRPXDL.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/CoreAudioTypes-2CBKPMSZ0ALD05AEKTF1BXLHP.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/DataDetection-1XWGM9NUEP6794947BYT21WC3.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/ptrcheck-C8MC9K1BP8T3OQJOAG1LT6J1C.pcm /Users/runner/work/_temp/dd/ModuleCache.noindex/OpenGLES-7MCHRYNKWCJQGCY45SAR5IFKH.pcm /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-dependencies-1.json (in target 'GlassNotify' from project 'GlassNotify')
CompileSwift normal arm64 (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    

LinkAssetCatalog /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Assets.xcassets (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-linkAssetCatalog --thinned /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/thinned --thinned-dependencies /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_dependencies_thinned --thinned-info-plist-content /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist_thinned --unthinned /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_output/unthinned --unthinned-dependencies /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_dependencies_unthinned --unthinned-info-plist-content /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist_unthinned --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app --plist-output /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist
note: Emplaced /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/AppIcon60x60@2x.png (in target 'GlassNotify' from project 'GlassNotify')
note: Emplaced /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Assets.car (in target 'GlassNotify' from project 'GlassNotify')

ProcessInfoPlistFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Info.plist /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Info.plist (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-infoPlistUtility /Users/runner/work/carnovel/carnovel/GlassNotify/GlassNotify/Info.plist -producttype com.apple.product-type.application -genpkginfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/PkgInfo -expandbuildsettings -format binary -platform iphoneos -additionalcontentfile /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/assetcatalog_generated_info.plist -requiredArchitecture arm64 -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Info.plist

SwiftDriverJobDiscovery normal arm64 Compiling BackgroundKeepAlive.swift, ContentView.swift, GlassNotifyApp.swift, NotifyServer.swift, GeneratedAssetSymbols.swift (in target 'GlassNotify' from project 'GlassNotify')

SwiftDriver\ Compilation\ Requirements GlassNotify normal arm64 com.apple.xcode.tools.swift.compiler (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-Swift-Compilation-Requirements -- /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -module-name GlassNotify -O -whole-module-optimization @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftFileList -enable-bare-slash-regex -enable-experimental-feature DebugDescriptionMacro -sdk /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -target arm64-apple-ios18.0 -g -module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -Xfrontend -serialize-debugging-options -swift-version 5 -I /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -c -num-threads 3 -Xcc -ivfsstatcache -Xcc /Users/runner/work/_temp/dd/SDKStatCaches.noindex/iphoneos26.5-23F81a-688ef53f1462e2c8f657fdc38a81448fee66e23052a0157c865c76b268046726.sdkstatcache -output-file-map /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-OutputFileMap.json -use-frontend-parseable-output -save-temps -no-color-diagnostics -explicit-module-build -module-cache-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/SwiftExplicitPrecompiledModules -clang-scanner-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -sdk-module-cache-path /Users/runner/work/_temp/dd/ModuleCache.noindex -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftmodule -validate-clang-modules-once -clang-build-session-file /Users/runner/work/_temp/dd/ModuleCache.noindex/Session.modulevalidation -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/swift-overrides.hmap -emit-const-values -Xfrontend -const-gather-protocols-file -Xfrontend /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_const_extract_protocols.json -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-generated-files.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-own-target-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-all-target-headers.hmap -Xcc -iquote -Xcc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify-project-headers.hmap -Xcc -I/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/include -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources-normal/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/arm64 -Xcc -I/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources -emit-objc-header -emit-objc-header-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-Swift.h -working-directory /Users/runner/work/carnovel/carnovel/GlassNotify -no-emit-module-separately-wmo

SwiftMergeGeneratedHeaders /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GlassNotify-Swift.h /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-Swift.h (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-swiftHeaderTool -arch arm64 /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-Swift.h -o /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/DerivedSources/GlassNotify-Swift.h

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/arm64-apple-ios.swiftmodule /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftmodule (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftmodule /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/arm64-apple-ios.swiftmodule

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/arm64-apple-ios.swiftdoc /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftdoc (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftdoc /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/arm64-apple-ios.swiftdoc

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/arm64-apple-ios.abi.json /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.abi.json (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.abi.json /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/arm64-apple-ios.abi.json

Copy /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftsourceinfo (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks -rename /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftsourceinfo /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.swiftmodule/Project/arm64-apple-ios.swiftsourceinfo

Ld /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/GlassNotify normal (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -Xlinker -reproducible -target arm64-apple-ios18.0 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -Os -L/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -L/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Intermediates.noindex/EagerLinkingTBDs/Release-iphoneos -F/Users/runner/work/_temp/dd/Build/Products/Release-iphoneos -filelist /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.LinkFileList -Xlinker -rpath -Xlinker /usr/lib/swift -Xlinker -rpath -Xlinker @executable_path/Frameworks -Xlinker -dead_strip -Xlinker -object_path_lto -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_lto.o -Xlinker -dependency_info -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_dependency_info.dat -fobjc-link-runtime -L/Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos -L/usr/lib/swift -Xlinker -add_ast_path -Xlinker /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.swiftmodule @/Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify-linker-args.resp -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/GlassNotify

CopySwiftLibs /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-swiftStdLibTool --copy --verbose --scan-executable /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/GlassNotify --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Frameworks --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/PlugIns --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/SystemExtensions --scan-folder /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Extensions --platform iphoneos --toolchain /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.cnhiRk/Metal.xctoolchain --toolchain /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --destination /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Frameworks --strip-bitcode --strip-bitcode-tool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/bitcode_strip --emit-dependency-info /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/SwiftStdLibToolInputDependencies.dep --filter-for-swift-os --back-deploy-swift-span
Ignoring --strip-bitcode because --sign was not passed

ExtractAppIntentsMetadata (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsmetadataprocessor --toolchain-dir /var/run/com.apple.security.cryptexd/mnt/com.apple.MobileAsset.MetalToolchain-v17.6.109.0.cnhiRk/Metal.xctoolchain --module-name GlassNotify --sdk-root /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk --xcode-version 17F113 --platform-family iOS --deployment-target 18.0 --bundle-identifier com.lath.glassnotify --output /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app --target-triple arm64-apple-ios18.0 --binary-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/GlassNotify --dependency-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify_dependency_info.dat --stringsdata-file /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/ExtractedAppShortcutsMetadata.stringsdata --source-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftFileList --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyMetadataFileList --static-metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyStaticMetadataFileList --swift-const-vals-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/Objects-normal/arm64/GlassNotify.SwiftConstValuesFileList --compile-time-extraction --deployment-aware-processing --validate-assistant-intents --no-app-shortcuts-localization
2026-10-21 08:24:31.881 appintentsmetadataprocessor[2337:10485] Starting appintentsmetadataprocessor export
2026-10-21 08:24:31.905 appintentsmetadataprocessor[2337:10485] warning: Metadata extraction skipped. No AppIntents.framework dependency found.

GenerateDSYMFile /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app.dSYM /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/GlassNotify (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/GlassNotify -o /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app.dSYM

AppIntentsSSUTraining (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/appintentsnltrainingprocessor --infoplist-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Info.plist --temp-dir-path /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/ssu --bundle-id com.lath.glassnotify --product-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app --extracted-metadata-path /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Metadata.appintents --metadata-file-list /Users/runner/work/_temp/dd/Build/Intermediates.noindex/GlassNotify.build/Release-iphoneos/GlassNotify.build/GlassNotify.DependencyMetadataFileList --source-file /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app/Info.plist --archive-ssu-assets
2026-10-21 08:24:31.952 appintentsnltrainingprocessor[2365:10542] Parsing options for appintentsnltrainingprocessor
2026-10-21 08:24:31.952 appintentsnltrainingprocessor[2365:10542] Starting AppIntents SSU YAML Generation
2026-10-21 08:24:31.958 appintentsnltrainingprocessor[2365:10542] No AppShortcuts found - Skipping.

RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-RegisterExecutionPolicyException /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app

Validate /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    builtin-validationUtility /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app -shallow-bundle -infoplist-subpath Info.plist

Touch /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app (in target 'GlassNotify' from project 'GlassNotify')
    cd /Users/runner/work/carnovel/carnovel/GlassNotify
    /usr/bin/touch -c /Users/runner/work/_temp/dd/Build/Products/Release-iphoneos/GlassNotify.app

** BUILD SUCCEEDED **

```
