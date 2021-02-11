module Bandcamp
  module Id
    module Playlist
      class Base < Bandcamp::Id::Base
        private

        def primary_args
          [@args.artist, bandcamp_playlist_id]
        end

        def bandcamp_playlist_id
          @args.send(model_name)
        end

        def link
          "https://#{@args.artist}.bandcamp.com/"\
            "#{model_name}/#{bandcamp_playlist_id}"
        end

        def model_response
          response_data[3]['data-tralbum']
        end

        def data
          { model_type.to_sym => model_data }
        end

        def model_data
          {
            id: model_response_data['id'],
            artist_id: artist_id
          }
        end

        def model_type
          model_response_data['item_type']
        end

        def artist_id
          model_response_data.dig('current', 'band_id')
        end
      end
    end
  end
end