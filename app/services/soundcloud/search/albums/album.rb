module SoundCloud
  module Search
    class Albums
      class Album < SoundCloud::Search::Albums
        include SoundCloud::Utils::Album

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

        def album
          @args[:album]
        end
      end
    end
  end
end
