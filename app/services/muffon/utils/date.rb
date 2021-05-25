module Muffon
  module Utils
    class Date < Muffon::Base
      class << self
        def format(date_data, date_format)
          format_date(date_data, date_format)
        end

        private

        def format_date(date_data, date_format)
          date_format ||= '%d %b %Y'

          date(date_data).strftime(date_format)
        rescue ArgumentError
          date_data
        end

        def date(date_data)
          case date_data.class.name
          when 'Array'
            ::Date.new(*date_data)
          when 'String'
            ::Date.parse(date_data)
          when 'Integer'
            Time.zone.at(date_data).to_date
          end
        end
      end
    end
  end
end
