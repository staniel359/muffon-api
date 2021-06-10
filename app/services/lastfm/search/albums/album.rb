module LastFM
  module Search
    class Albums
      class Album < LastFM::Search::Albums
        include LastFM::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            artist: artist_formatted,
            artists: artists,
            image: image_data,
            listeners_count: listeners_count
          }
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
