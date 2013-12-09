Pod::Spec.new do |s|
  s.name     = 'ITActionManager'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'Method dispatcher and progress handler.'
  s.homepage = 'https://github.com/Iterar/ITActionManager'
  s.authors  = { 'Tiago Alves' => 'tiago@iterar.co' }
  s.source   = { :git => 'https://github.com/Iterar/ITActionManager', :tag => "0.0.1" }
  s.requires_arc = true

  s.public_header_files = "ITActionManager/**/*.{h,m}", "NSInvocation+SimpleCreation/**/*.{h,m}"
  s.source_files = 'AFNetworking/AFNetworking.h'
end