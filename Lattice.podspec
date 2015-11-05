Pod::Spec.new do |s|
  s.name = 'Lattice'
  s.version = '0.2'
  s.license = 'MIT'
  s.summary = 'Reusable UI Code Pieces'
  s.homepage = 'https://github.com/Tallwave/Lattice'
  s.social_media_url = 'http://twitter.com/swilliams'
  s.authors = { 'Scott Williams' => 'scott@swilliams.me' }
  s.source = { :git => 'https://github.com/Tallwave/Lattice.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Lattice/**/*.swift'

  s.requires_arc = true
end
