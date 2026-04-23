module LastFM
  module Artist
    class Shows
      class Show < LastFM::Artist::Shows
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_show_data
          ]
        end

        def data
          {
            title:,
            location:,
            country:,
            place:,
            date:
          }
        end

        def title
          raw_show_data
            .css('.events-list-item-event-name')
            .text
            .strip
        end

        def raw_show_data
          @args[:raw_show_data]
        end

        def location
          raw_show_data
            .css('.events-list-item-venue--address')[0]
            .text
            .strip
        end

        def country
          location
            .split(', ')
            .last
        end

        def place
          raw_show_data
            .css('.events-list-item-venue--title')[0]
            .text
            .strip
        end

        def date
          Muffon::Formatter::Date.call(
            date: raw_date
          )
        end

        def raw_date
          raw_show_data
            .css('.events-list-item-date')[0]['content']
        end
      end
    end
  end
end
