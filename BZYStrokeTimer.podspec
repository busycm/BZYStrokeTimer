#
# Be sure to run `pod lib lint BZYStrokeTimer.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "BZYStrokeTimer"
    s.version          = "1.0.0"
    s.summary          = "It's really cool"
    s.description      = <<-DESC
                            Something something!
                        DESC
    s.homepage         = "https://github.com/busycm/BZYStrokeTimer"
    s.license          = 'MIT'
    s.authors           = { "startupthekid" => "conronb@gmail.com", "ruddfawcett" => "rudd.fawcett@gmail.com" }
    s.source           = { :git => "https://github.com/busycm/BZYStrokeTimer.git", :tag => s.version.to_s }
        s.social_media_url = 'https://twitter.com/busycm'

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.source_files = 'Pod/Classes/**/*'
    s.frameworks = 'UIKit', 'Foundation'
end