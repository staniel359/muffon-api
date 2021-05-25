module Muffon
  module Utils
    class Duration < Muffon::Base
      class << self
        def format(data)
          format_duration(data)
        end

        private

        def format_duration(data)
          seconds = seconds_formatted(data)

          Time.at(seconds).utc.strftime(
            duration_format(seconds)
          )
        end

        def seconds_formatted(data)
          return data.to_i unless duration?(data)

          time_formatted(data)
        end

        def duration?(data)
          data.try('include?', ':')
        end

        def time_formatted(data)
          data
            .split(':')
            .map(&:to_i)
            .inject(0) { |a, b| a * 60 + b }
        end

        def duration_format(seconds)
          seconds >= 3600 ? '%H:%M:%S' : '%M:%S'
        end
      end
    end
  end
end
