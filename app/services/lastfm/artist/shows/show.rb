module LastFM
  module Artist
    class Shows
      class Show < LastFM::Artist::Shows
        def call
          data
        end

        private

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
          show.css(
            '.events-list-item-event-name'
          ).text.strip
        end

        def show
          @args[:show]
        end

        def location
          @location ||=
            show.css(
              '.events-list-item-venue--address'
            )[0].text.strip
        end

        def country
          location.split(
            ', '
          ).last
        end

        def place
          show.css(
            '.events-list-item-venue--title'
          )[0].text.strip
        end

        def date
          date_formatted(
            raw_date
          )
        end

        def raw_date
          show.css(
            '.events-list-item-date'
          )[0]['content']
        end
      end
    end
  end
end
