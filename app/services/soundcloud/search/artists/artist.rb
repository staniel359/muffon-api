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
          muffon_data
            .merge(artist_data)
        end

        def artist_data
          {
            soundcloud_id: artist['id'],
            name:,
            image: image_data
          }.compact
        end

        def artist
          @args[:artist]
        end

        def name
          artist['username']
        end

        def image_data
          image_data_formatted(
            artist['avatar_url']
          )
        end
      end
    end
  end
end
