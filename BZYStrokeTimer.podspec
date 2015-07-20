Pod::Spec.new do |s|
    s.name             = "BZYStrokeTimer"
    s.version          = "1.0.3"
    s.summary          = "BZYStrokeTimer is an awesome and beautifully simple timer built off CAShapeLayer."
    s.description      = <<-DESC
                            BZYStrokeTimer is an awesome and beautifully simple timer built off CAShapeLayer.
                            Highly customizable and utilizes IBInspectable for easy integration with storyboards.
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
