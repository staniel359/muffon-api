module Muffon
  module Utils
    class Date < Muffon::Base
      FORMAT = '%Y-%m-%d'.freeze

      def call
        data
      end

      private

      def data
        return '' if @args[:data].blank?

        send(
          "date_#{class_name}_formatted"
        )
      end

      def class_name
        @args[:data]
          .class
          .name
          .downcase
      end

      def date_integer_formatted
        return '' if @args[:data].zero?

        Time
          .zone
          .at(@args[:data])
          .to_date
          .strftime(FORMAT)
      end

      def date_string_formatted
        return '' if @args[:data] == '0'

        ::Date.parse(
          @args[:data]
        ).strftime(
          date_string_format
        )
      rescue ::Date::Error
        date_without_zero_items
      end

      def date_string_format
        format_formatted(
          date_items_count
        )
      end

      def date_items_count
        @args[:data].split(
          /[\s\-]/
        ).size
      end

      def format_formatted(size)
        FORMAT
          .split('-')
          .slice(0, size)
          .join('-')
      end

      def date_without_zero_items
        @args[:data].gsub(
          '-00', ''
        )
      end

      def date_array_formatted
        ::Date.new(
          *@args[:data]
        ).strftime(
          date_array_format
        )
      end

      def date_array_format
        format_formatted(
          @args[:data].size
        )
      end
    end
  end
end
