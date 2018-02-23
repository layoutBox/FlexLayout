
Pod::Spec.new do |spec|
  spec.name         = "FlexLayout"
  spec.version      = "1.2.4"
  spec.summary      = "FlexLayout"

  spec.homepage     = "https://github.com/lucdion/FlexLayout.git"
  spec.license      = "BSD 3-clause"
  
  spec.author             = { 
    "Luc Dion" => "ldion@mirego.com"
  }
  
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.{swift,h,m,cpp,c}"

  #spec.compiler_flags = [
  #    '-fno-omit-frame-pointer',
  #    '-fexceptions',
  #    '-Wall',
  #    '-Werror',
  #    '-std=c11',
  #    '-fPIC'
  #]
end
