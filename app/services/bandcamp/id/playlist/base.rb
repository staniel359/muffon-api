module Bandcamp
  module Id
    module Playlist
      class Base < Bandcamp::Id::Base
        private

        def model_response
          @model_response ||=
            response_data[4]['data-tralbum'] ||
            response_data[5]['data-tralbum']
        end

        def id_data
          {
            title:,
            bandcamp_id:,
            bandcamp_model: model_type,
            artist: artist_names_data,
            artists:
          }
        end

        def title
          model_response_data.dig(
            'current', 'title'
          )
        end

        def model_type
          model_response_data[
            'item_type'
          ]
        end

        def artist_data
          {
            name: artist_name,
            bandcamp_id: artist_bandcamp_id
          }
        end

        def artist_name
          artist['name']
        end

        def artist
          @artist ||= JSON.parse(
            response_data[4]['data-band'] ||
              response_data[5]['data-band']
          )
        end

        def artist_bandcamp_id
          artist['id']
        end
      end
    end
  end
end
