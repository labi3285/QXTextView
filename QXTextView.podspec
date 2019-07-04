Pod::Spec.new do |s|

s.name         = "QXTextView"
s.version      = "0.0.3"
s.summary      = "An attributted label view in swift."
s.description  = <<-DESC
support text image custom-view lineBreakItem underline link etc.
DESC
s.homepage     = "https://github.com/labi3285/QXTextView"
s.license      = "MIT"
s.author       = { "labi3285" => "766043285@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/labi3285/QXTextView.git", :tag => "#{s.version}" }
s.source_files  = "QXTextView/QXTextView/*.swift"
s.requires_arc = true

s.dependency 'QXUIKitExtension'

end
