module Muffon
  module Utils
    class Date < Muffon::Base
      class << self
        FORMAT = '%d %b %Y'.freeze

        def format(date)
          return '' if date.blank?

          date_formatted(date)
        end

        private

        def date_formatted(date)
          class_name = date.class.name.downcase
          method_name = "date_#{class_name}_formatted"

          send(method_name, date)
        end

        def date_integer_formatted(date)
          return '' if date.zero?

          Time.zone.at(date).to_date.strftime(
            FORMAT
          )
        end

        def date_string_formatted(date)
          return '' if date == '0'

          format = format_formatted(
            date.split(/[\s\-]/).size
          )

          ::Date.parse(date).strftime(format)
        rescue ::Date::Error
          date.gsub(
            '-00', ''
          )
        end

        def format_formatted(size)
          FORMAT.split.reverse.slice(
            0, size
          ).reverse.join(' ')
        end

        def date_array_formatted(date)
          format = format_formatted(date.size)

          ::Date.new(*date).strftime(format)
        end
      end
    end
  end
end
