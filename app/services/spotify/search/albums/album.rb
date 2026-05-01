module Spotify
  module Search
    class Albums
      class Album < Spotify::Base
        include Spotify::Mixins::Album

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
            source_album_id: spotify_id,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data].dig('data', 'preReleaseContent') ||
            @args[:raw_album_data]['data']
        end
      end
    end
  end
end
