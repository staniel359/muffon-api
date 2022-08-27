module Muffon
  module Utils
    class Duration < Muffon::Base
      def call
        data
      end

      private

      def data
        Time
          .at(seconds)
          .utc
          .strftime(duration_format)
      end

      def seconds
        @seconds ||= seconds_formatted
      end

      def seconds_formatted
        return time_formatted if duration?

        @args[:data].to_i
      end

      def duration?
        @args[:data].try(
          'include?', ':'
        )
      end

      def time_formatted
        @args[:data]
          .split(':')
          .map(&:to_i)
          .inject(0) do |a, b|
            (a * 60) + b
          end
      end

      def duration_format
        with_hours? ? '%H:%M:%S' : '%M:%S'
      end

      def with_hours?
        seconds >= 3_600
      end
    end
  end
end
