module Muffon
  module Radio
    module Artist
      class Base < Muffon::Base
        private

        def primary_args
          [@args[:artist]]
        end

        def no_data?
          total_pages.blank? || artist_data.blank?
        end

        def total_pages
          @total_pages ||=
            retrieve_artist_data[:total_pages]
        end

        def retrieve_artist_data(page = nil)
          artist_service.call(
            artist: @args[:artist],
            limit: 1,
            page: page
          )[:artist]
        end

        def artist_data
          @artist_data ||= retrieve_artist_data(
            random_page
          )
        end

        def random_page
          rand(1..max_page)
        end

        def max_page
          [total_pages, total_limit].min
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

        def radio_data
          {
            artist: artist_data[:name],
            track: track
          }
        end

        def random_track
          tracks.first
        end
      end
    end
  end
end
