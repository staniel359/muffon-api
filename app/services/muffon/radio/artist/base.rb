module Muffon
  module Radio
    module Artist
      class Base < Muffon::Base
        private

        def primary_args
          [@args[:artist]]
        end

        def no_data?
          total_pages.blank? ||
            radio_artist_data.blank?
        end

        def total_pages
          @total_pages ||=
            retrieve_radio_artist_data[
              :total_pages
            ]
        end

        def retrieve_radio_artist_data(page = nil)
          artist_service.call(
            artist: @args[:artist],
            limit: 1,
            page:
          )[:artist] || {}
        end

        def radio_artist_data
          @radio_artist_data ||=
            retrieve_radio_artist_data(
              random_page
            )
        end

        def random_page
          rand(1..max_page)
        end

        def max_page
          [
            total_pages,
            total_limit
          ].min
        end

        def total_limit
          self.class::TOTAL_LIMIT
        end

        def artist_service
          "::LastFM::Artist::#{collection_name}".constantize
        end

        def collection_name
          self.class::COLLECTION_NAME.capitalize
        end

        def data
          return call if no_track?

          { radio: radio_data }
        end

        def no_track?
          radio_track_data.blank?
        end

        def radio_data
          { track: track_data }
        end

        def track_data
          radio_track_data.merge(
            radio_track_artists_data
          )
        end

        def radio_track_artists_data
          {
            artist: artist_names_data,
            artists:
          }
        end

        def artists
          [artist_data]
        end

        def artist_data
          { name: artist_name }
        end

        def artist_name
          artist_data[:name]
        end
      end
    end
  end
end
