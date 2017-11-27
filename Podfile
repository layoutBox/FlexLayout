use_frameworks!
platform :ios, '9.0'

workspace 'FlexLayout.xcworkspace'

target 'FlexLayoutTests' do
  project 'FlexLayout.xcodeproj'
  pod 'FlexLayout', :path => './'

  pod 'Quick'
  pod 'Nimble', :inhibit_warnings => true
end

target 'FlexLayoutSample' do
  project 'Example/FlexLayoutSample.xcodeproj'

  pod 'FlexLayout', :path => './'
  pod 'PinLayout'

  # Debug only
  pod 'Reveal-SDK', '~> 10', :configurations => ['Debug']
  pod 'SwiftLint'
end

