require 'json'

module JSONAPI
  class Grader
    def initialize(implementation_dir)
      @implementation_dir = implementation_dir
      scenarii_file = File.dirname(__FILE__) + '/../../scenarii.json'
      @scenarii = JSON.parse(File.read(scenarii_file))
    end

    def grade
      compliance = true
      score = 0
      max_score = 0
      @scenarii.each do |scenario|
        current_score = score_scenario(scenario)
        compliance = false if scenario['required'] && current_score == 0
        max_score += scenario['score']
        score += current_score
      end

      STDERR.puts "Compliance: #{compliance}"
      score_percent = (100.0 * score / max_score).round(2)
      STDERR.puts "Score: #{score} / #{max_score} (#{score_percent}%)"

      score
    end

    private

    def score_scenario(scenario)
      document_file = File.dirname(__FILE__) + "/../../#{scenario['file']}"
      reference_document = normalize(JSON.parse(File.read(document_file)))
      implementation = "#{@implementation_dir}/#{scenario['name']}"
      STDERR.print "Running scenario #{scenario['name']}... "
      $stderr.flush
      unless File.exists?(implementation)
        STDERR.puts "not implemented"
        return 0
      end

      actual_document = normalize(JSON.parse(`#{implementation}`))
      if reference_document == actual_document
        STDERR.puts "passed"
        return scenario['score']
      else
        STDERR.puts "failed"
        STDERR.puts "Expected: #{reference_document}"
        STDERR.puts "Got: #{actual_document}"
        $stderr.flush
        return 0
      end
    end

    def normalize(document)
      return document unless document.key?('included')

      document['included'].sort do |a, b|
        [a['type'], a['id']] <=> [b['type'], b['id']]
      end
    end
  end
end
