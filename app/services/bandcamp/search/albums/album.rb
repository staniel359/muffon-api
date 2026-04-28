module Bandcamp
  module Search
    class Albums
      class Album < Bandcamp::Search::Base
        include Bandcamp::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: bandcamp_id,
            source_album_artist_id: artist_bandcamp_id,
            source_model: bandcamp_model,
            title:,
            artists:,
            image_data:,
            release_date: nil,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data]
        end

        def title
          raw_album_data['name']
        end

        def bandcamp_id
          raw_album_data['id']
        end

        def source_original_link
          raw_album_data['item_url_path']
        end

        def bandcamp_model
          'album'
        end
      end
    end
  end
end
