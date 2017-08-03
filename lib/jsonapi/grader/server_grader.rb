require 'jsonapi/grader/server/scenarii'

module JSONAPI
  module Grader
    class ServerGrader
      SCENARII = [Server::EmptyCollectionScenario.new]

      def initialize(options = {})
        @host = options[:host]
      end

      def grade
        compliance = true
        score = 0
        max_score = 0
        SCENARII.each do |scenario|
          STDERR.print "Running scenario #{scenario.name}... "
          $stderr.flush

          begin
            scenario.call(@host)
            STDERR.puts "passed"
            score += scenario.score
          rescue Exception => error
            STDERR.puts "failed"
            STDERR.puts scenario.description
            STDERR.puts ">>> #{error}"
            compliance = false if scenario.required
          end
          max_score += scenario.score
        end

        STDERR.puts "Compliance: #{compliance}"
        score_percent = (100.0 * score / max_score).round(2)
        STDERR.puts "Score: #{score} / #{max_score} (#{score_percent}%)"

        score
      end
    end
  end
end
