Gem::Specification.new do |s|
  s.name        = 'tayu'
  s.version     = '0.0.3'
  s.date        = '2013-05-17'
  s.summary     = 'Integrates PuppetDB with Rundeck'
  s.description = 'Provides a resource endpoint for RunDeck from a PuppetDB server'
  s.authors     = 'Adrian van Dongen'
  s.email       = 'sirhopcount@goodfellasonline.nl'
  s.files       = ['lib/tayu.rb', 'config/tayu.yml']
  s.homepage    = 'http://github.com/sirhopcount/tayu'
  s.executable  = 'tayu'
  s.add_runtime_dependency 'builder', '>= 2.0.0'
  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'sinatra'
end
