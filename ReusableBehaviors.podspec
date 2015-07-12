Pod::Spec.new do |s|
  s.name = 'ReusableBehaviors
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Reusable UI Code Pieces'
  s.homepage = 'https://github.com/Tallwave/ReusableBehaviors'
  s.social_media_url = 'http://twitter.com/swilliams'
  s.authors = { 'Scott Williams' => 'scott@swilliams.me' }
  s.source = { :git => 'https://github.com/Tallwave/ReusableBehaviors.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ReusableBehaviors/*.swift'

  s.requires_arc = true
end
