Pod::Spec.new do |s|
  s.name             = 'flutter_zoom_wrapper'
  s.version          = '0.0.1'
  s.summary          = 'Custom Zoom SDK integration'
  s.description      = <<-DESC
                       Custom Zoom SDK integration
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Mplify Tech Services Pvt Ltd.' => 'contact@mplifytech.com' }
  s.source           = { :path => '.' }

  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.ios.vendored_frameworks = 'ZoomSDK/MobileRTC.xcframework'
   s.resource_bundles = {
      'MobileRTCResources' => ['ZoomSDK/MobileRTCResources.bundle']
    }

  s.frameworks = 'UIKit', 'Foundation', 'AVFoundation', 'CoreGraphics', 'SystemConfiguration', 'MobileCoreServices', 'Security'
  s.libraries = 'z', 'c++'

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'OTHER_LDFLAGS' => '-framework MobileRTC'
  }

  s.swift_version = '5.0'
end
