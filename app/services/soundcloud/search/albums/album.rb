module SoundCloud
  module Search
    class Albums
      class Album < SoundCloud::Search::Albums
        include SoundCloud::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            soundcloud_id: soundcloud_id,
            artist: artist_formatted,
            artists: artists,
            image: image_data
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
