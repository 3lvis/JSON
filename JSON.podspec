Pod::Spec.new do |s|
  s.name             = "JSON"
  s.summary          = "JSON made so simple, it hurts"
  s.version          = "3.1.0"
  s.homepage         = "https://github.com/3lvis/JSON"
  s.license          = 'MIT'
  s.author           = { "Elvis Nuñez" => "elvisnunez@me.com" }
  s.source           = { :git => "https://github.com/3lvis/JSON.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/3lvis'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.frameworks = 'Foundation'
end
