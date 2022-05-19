
Pod::Spec.new do |spec|
  spec.name         = "FlexLayout"
  spec.version      = "1.3.24"
  spec.summary      = "FlexLayout"
  spec.homepage     = "https://github.com/lucdion/FlexLayout.git"
  spec.license      = "MIT license"
  spec.author       = { "Luc Dion" => "luc_dion@yahoo.com" }

  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/Swift/**/*.{swift,h,m,mm,cpp,c}"
  spec.dependency 'YogaKit', '~> 1.18.1'
  spec.libraries    = 'c++'
  
end
