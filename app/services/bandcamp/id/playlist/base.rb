module Bandcamp
  module Id
    module Playlist
      class Base < Bandcamp::Id::Base
        include Bandcamp::Utils::Album

        private

        def model_response
          @model_response ||=
            response_data[4]['data-tralbum'] ||
            response_data[5]['data-tralbum']
        end

        def id_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def bandcamp_id
          model_response_data['id']
        end

        def artist_bandcamp_id
          artist['id']
        end

        def artist
          @artist ||= JSON.parse(
            raw_artist
          )
        end

        def raw_artist
          response_data[4]['data-band'] ||
            response_data[5]['data-band']
        end

        def bandcamp_model
          model_response_data[
            'item_type'
          ]
        end

        def title
          model_response_data.dig(
            'current', 'title'
          )
        end

        def artist_data
          {
            source: artist_source_data,
            name: artist_name
          }
        end

        def artist_source_data
          {
            name: source_name,
            id: artist_bandcamp_id
          }
        end

        def artist_name
          artist['name']
        end
      end
    end
  end
end
