module Bandcamp
  module Id
    module Playlist
      class Base < Bandcamp::Id::Base
        private

        def model_response
          @model_response ||=
            response_data[4]['data-tralbum']
        end

        def id_data
          {
            title: title,
            bandcamp_id: bandcamp_id,
            bandcamp_model: model_type,
            artists: artists
          }
        end

        def title
          model_response_data.dig(
            'current', 'title'
          )
        end

        def model_type
          model_response_data['item_type']
        end

        def artists
          [artist_data_formatted]
        end

        def artist_data_formatted
          {
            name: artist['name'],
            bandcamp_id: artist['id']
          }
        end

        def artist
          @artist ||= JSON.parse(
            response_data[4]['data-band']
          )
        end
      end
    end
  end
end
