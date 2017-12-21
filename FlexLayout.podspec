
Pod::Spec.new do |s|
  s.name         = "FlexLayout"
  s.version      = "1.2.2"
  s.summary      = "FlexLayout"

  s.homepage     = "https://github.com/lucdion/FlexLayout.git"
  s.license      = "BSD 3-clause"
  
  s.author             = { 
    "Luc Dion" => "ldion@mirego.com"
  }
  
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.{swift,h,m}"

  # Latest master commit id.
  s.dependency "Yoga"
end
