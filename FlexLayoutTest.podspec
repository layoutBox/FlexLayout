#
#  Be sure to run `pod spec lint Taylor.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "FlexLayoutTest"
  s.version      = "0.0.1"
  s.summary      = "FlexLayoutTest"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  # s.description  = <<-DESC 
  
  s.homepage     = "https://github.com/lucmirego/FlexLayout.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "BSD 3-clause"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { 
    "Luc Dion" => "ldion@mirego.com"
  }
  
  s.platform     = :ios, "8.0"
  s.tvos.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/lucmirego/FlexLayout.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"

  s.dependency "YogaKit", "~> 1.5"
end
