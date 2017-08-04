Gem::Specification.new do |s|
  s.name        = 'jsonapi-grader'
  s.version     = '0.1.0'
  s.date        = '2017-08-02'
  s.summary     = "Grade jsonapi.org implementations."
  s.description = "Ensure compliance of your JSON API library."
  s.authors     = ["Lucas Hosseini"]
  s.email       = 'lucas.hosseini@gmail.com'
  s.files       = ["scenarii_serialization.json"] + Dir["./lib/**/*.rb"] +
                  Dir["./scenarii/*.json"]
  s.executables << 'jsonapi-grader'
  s.homepage    = 'https://github.com/beauby/jsonapi-grader'
  s.license     = 'MIT'
end
