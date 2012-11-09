Gem::Specification.new do |s|
  s.name        = 'tayu'
  s.version     = '0.0.2'
  s.date        = '2012-11-09'
  s.summary     = "Integrates PuppetDB with Rundeck"
  s.description = "Provides a resource endpoint for RunDeck from a PuppetDB server"
  s.authors     = "Adrian van Dongen"
  s.email       = 'sirhopcount@goodfellasonline.nl'
  s.files       = ["lib/tayu.rb", "config/tayu.yml"]
  s.homepage    = 'http://github.com/sirhopcount/tayu'
  s.executable  = 'tayu'
  s.add_runtime_dependency "sinatra"
  s.add_dependency "builder", ">= 2.0.0"
end
