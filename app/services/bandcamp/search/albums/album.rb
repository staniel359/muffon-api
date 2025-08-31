module Bandcamp
  module Search
    class Albums
      class Album < Bandcamp::Search::Albums
        include Muffon::Utils::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            album
          ]
        end

        def data
          self_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        alias model album
        alias title name
      end
    end
  end
end
