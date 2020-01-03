#
# Be sure to run `pod lib lint XLPagerTabStripObjcContinue.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XLPagerTabStripObjcContinue'
  s.version          = '1.0.1'
  s.summary          = 'A short description of XLPagerTabStripObjcContinue.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/FPJack/XLPagerTabStripObjcContinue'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FPJack' => '2551412939@qq.com' }
  s.source           = { :git => 'https://github.com/FPJack/XLPagerTabStripObjcContinue.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

#  s.ios.deployment_target = '9.0'

#  s.source_files = 'XLPagerTabStripObjcContinue/Classes/**/*'
  
   s.resource_bundles = {
     'XLPagerTabStripObjcContinue' => ['XLPagerTabStripObjcContinue/Assets/*.png','XLPagerTabStripObjcContinue/Assets/*.xib']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
#  s.dependency 'MXParallaxHeader','~> 1.1.0'
  s.subspec 'XLPagerTabStrip' do |x|
  x.ios.deployment_target = '9.0'
  x.source_files = 'XLPagerTabStripObjcContinue/Classes/XLPagerTabStrip/*.{h,m}'
  end
  
  s.subspec 'MXParallaxHeader' do |m|
  m.ios.deployment_target = '9.0'
  m.source_files = 'XLPagerTabStripObjcContinue/Classes/MXParallaxHeader/*.{h,m}'
  m.dependency 'XLPagerTabStripObjcContinue/XLPagerTabStrip'
  m.dependency 'MXParallaxHeader','~> 1.1.0'
  end
end
