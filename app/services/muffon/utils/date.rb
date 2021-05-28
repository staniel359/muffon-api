module Muffon
  module Utils
    class Date < Muffon::Base
      class << self
        def format(date, format = nil)
          format_date(date, format)
        end

        private

        def format_date(date, format)
          return '' if date == '0'

          date_parsed(date).strftime(
            format || '%d %b %Y'
          )
        rescue ArgumentError
          date
        end

        def date_parsed(date)
          case date.class.name
          when 'Array'
            ::Date.new(*date)
          when 'String'
            ::Date.parse(date)
          when 'Integer'
            Time.zone.at(date).to_date
          end
        end
      end
    end
  end
end
