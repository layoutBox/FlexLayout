
Pod::Spec.new do |spec|
  spec.name         = "FlexLayout"
  spec.version      = "1.3.32"
  spec.summary      = "FlexLayout"
  spec.homepage     = "https://github.com/lucdion/FlexLayout.git"
  spec.license      = "MIT license"
  spec.author       = { "Luc Dion" => "luc_dion@yahoo.com" }

  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.{swift,h,m,mm,cpp,c}"
  spec.public_header_files = "Sources/yoga/include/yoga/*.h", "Sources/YogaKit/include/YogaKit/*.h"
  spec.libraries    = 'c++'

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
