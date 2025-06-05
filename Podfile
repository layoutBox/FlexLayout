source 'https://cdn.cocoapods.org/'
use_frameworks! :linkage => :static
platform :ios, '13.4'

workspace 'FlexLayout.xcworkspace'

target 'FlexLayout' do
  pod 'Yoga'
end

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
