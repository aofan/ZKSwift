Pod::Spec.new do |s|
s.name             = "ZKSwift"
s.version          = "1.3.0"
s.summary          = "Swift MVC"
s.description      = "Swift MVC"


s.homepage         = "https://github.com/aofan/ZKSwift"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "lizhikai" => "673875394@qq.com" }
s.source           = { :git => "https://github.com/aofan/ZKSwift.git", :tag => "1.3.0" }
# s.social_media_url = 'https://twitter.com/NAME'

s.platform     = :ios, '8.0'
# s.ios.deployment_target = '5.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

s.source_files = 'ZKSwift/*'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation'

s.dependency 'SwiftyJSON'
s.dependency 'Alamofire', '~> 3.4'
s.dependency 'D3Model', '~> 2.0.3'
s.dependency'XWSwiftRefresh', '~> 0.1.9'
s.dependency 'XLProgressHUD', '~> 1.0.5'

end