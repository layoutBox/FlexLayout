
Pod::Spec.new do |s|
  s.name         = "FlexLayout"
  s.version      = "1.0.0"
  s.summary      = "FlexLayout"

  s.homepage     = "https://github.com/lucdion/FlexLayout.git"
  s.license      = "BSD 3-clause"
  
  s.author             = { 
    "Luc Dion" => "ldion@mirego.com"
  }
  
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"

  s.dependency "YogaKit", "~> 1.6"
end
