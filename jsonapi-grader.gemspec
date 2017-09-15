Gem::Specification.new do |s|
  s.name        = 'jsonapi-grader'
  s.version     = '0.1.0'
  s.date        = '2017-08-02'
  s.summary     = "Grade jsonapi.org implementations."
  s.description = "Ensure compliance of your JSON API library."
  s.authors     = ["Lucas Hosseini"]
  s.email       = 'lucas.hosseini@gmail.com'
  s.files       = Dir["./spec/**/*.rb"]
  s.bindir      = 'bin'
  s.executables << 'jsonapi-grader'
  s.homepage    = 'https://github.com/beauby/jsonapi-grader'
  s.license     = 'MIT'

  s.add_runtime_dependency 'rake'
  s.add_runtime_dependency 'rspec'
  s.add_runtime_dependency 'jsonapi-rspec'
end
