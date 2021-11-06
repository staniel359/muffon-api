module SoundCloud
  module Search
    class Artists
      class Artist < SoundCloud::Search::Artists
        include Muffon::Utils::Artist

        def call
          data
        end

        private

        def data
          {
            id: id,
            soundcloud_id: soundcloud_id,
            name: name,
            image: image_data
          }
        end

        def artist
          @artist ||= @args.artist
        end

        def name
          artist['username']
        end

        def soundcloud_id
          artist['id']
        end

        def image_data
          image_data_formatted(
            artist['avatar_url'], 'artist'
          )
        end
      end
    end
  end
end
