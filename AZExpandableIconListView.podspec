#
# Be sure to run `pod lib lint AZExpandableIconListView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AZExpandableIconListView"
  s.version          = "0.2.0"
  s.summary          = "Expandable icon list view"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
An expandable/collapsible UIView that holds an array of UIImageView. Something like accordion.
                       DESC

  s.homepage         = "https://github.com/Azuritul/AZExpandableIconListView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Chris Wu(Azuritul)" => "azuritul@gmail.com" }
  s.source           = { :git => "https://github.com/Azuritul/AZExpandableIconListView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/azuritul'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  #s.resource_bundles = {
  #  'AZExpandableIconListView' => ['Pod/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
