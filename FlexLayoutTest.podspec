
Pod::Spec.new do |s|
  s.name         = "FlexLayoutTest"
  s.version      = "0.0.4"
  s.summary      = "FlexLayoutTest"

  s.homepage     = "https://github.com/lucmirego/FlexLayout.git"
  s.license      = "BSD 3-clause"
  
  s.author             = { 
    "Luc Dion" => "ldion@mirego.com"
  }
  
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/lucmirego/FlexLayout.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"

  s.dependency "YogaKit", "~> 1.5"
end
