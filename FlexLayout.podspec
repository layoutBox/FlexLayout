
Pod::Spec.new do |spec|
  spec.name         = "FlexLayout"
  spec.version      = "1.3.6"
  spec.summary      = "FlexLayout"
  spec.homepage     = "https://github.com/lucdion/FlexLayout.git"
  spec.license      = "BSD 3-clause"
  spec.author       = { "Luc Dion" => "ldion@mirego.com" }
  
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.{swift,h,m,mm,cpp,c}"
  spec.public_header_files = "Sources/yoga/{Yoga,YGEnums,YGMacros}.h", "Sources/YogaKit/{UIView+Yoga,YGLayout}.h"

  # Should match yoga_defs.bzl + BUCK configuration
  spec.compiler_flags = [
     '-fno-omit-frame-pointer',
     '-fexceptions',
     '-Wall',
     '-Werror',
     '-std=c++1y',
     '-fPIC'
  ]
end
