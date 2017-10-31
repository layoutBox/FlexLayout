use_frameworks!

workspace 'FlexLayout.xcworkspace'

target 'FlexLayout' do
  project 'FlexLayout.xcodeproj'
  pod 'YogaKit', '~> 1.6'
  pod 'SwiftLint'
end

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

