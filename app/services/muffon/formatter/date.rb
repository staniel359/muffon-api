module Muffon
  module Formatter
    class Date < Muffon::Base
      FORMAT = '%Y-%m-%d'.freeze

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          date
        ]
      end

      def data
        case @args[:date]
        when Integer
          date_integer_formatted
        when String
          date_string_formatted
        when Array
          date_array_formatted
        end
      end

      def date_integer_formatted
        return if @args[:date].zero?

        Time
          .zone
          .at(@args[:date])
          .to_date
          .strftime(FORMAT)
      end

      def date_string_formatted
        return if @args[:date] == '0'

        ::Date
          .parse(@args[:date])
          .strftime(date_string_format)
      rescue ::Date::Error
        date_without_zero_items
      end

      def date_string_format
        format_formatted(
          date_items_count
        )
      end

      def date_items_count
        @args[:date]
          .split(/[\s-]/)
          .size
      end

      def format_formatted(size)
        FORMAT
          .split('-')
          .slice(0, size)
          .join('-')
      end

      def date_without_zero_items
        @args[:date].gsub('-00', '')
      end

      def date_array_formatted
        ::Date
          .new(*@args[:date])
          .strftime(date_array_format)
      end

      def date_array_format
        format_formatted(
          @args[:date].size
        )
      end
    end
  end
end
