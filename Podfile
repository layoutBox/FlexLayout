source 'https://cdn.cocoapods.org/'
use_frameworks!
platform :ios, '12.0'

workspace 'FlexLayout.xcworkspace'

target 'FlexLayoutTests' do
  project 'FlexLayout.xcodeproj'
  pod 'FlexLayout', path: './'
end

target 'FlexLayoutSample' do
  project 'Example/cocoapods/FlexLayoutSample.xcodeproj'

  pod 'FlexLayout', path: './'
  pod 'PinLayout'

  # Debug only
  pod 'SwiftLint'
end
