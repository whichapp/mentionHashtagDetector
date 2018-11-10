
Pod::Spec.new do |s|
  s.name             = 'whichappMHdetector'
  s.version          = '0.1.0'
  s.summary          = 'Detecting @ and # in UITextView and UITextField.'
  s.description      = <<-DESC
  Detecting Mention `@` and Hashtag `#` in UITextView and UITextField. it will automatically detect the word while user typing and distinguishing the type of it. you just need to set delegate and call mentionHashtagDetector func under the textDidChange(_:).
                       DESC
  s.homepage         = 'https://github.com/whichapp/mentionHashtagDetector'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sajjadsarkoobi' => 'sarkoobi@whichapp.com' }
  s.source           = { :git => 'https://github.com/whichapp/mentionHashtagDetector.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  s.source_files = 'whichappMHdetector/Classes/**/*'
  # s.resource_bundles = {
  #   'whichappMHdetector' => ['whichappMHdetector/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
