module Muffon
  module Profile
    module Library
      class Artists
        class Artist < Muffon::Profile::Library::Artists
          include Muffon::Utils::Artist

          def call
            data
          end

          private

          def data
            {
              id: id,
              artist_id: artist_id,
              favorite_id: favorite_id,
              name: name,
              image: image_data,
              albums_count: albums_count,
              tracks_count: tracks_count
            }.compact
          end

          def id
            profile_artist.id
          end

          def profile_artist
            @profile_artist ||= @args.artist
          end

          def artist_id
            profile_artist.artist_id
          end

          def name
            profile_artist
              .artist
              .name
          end

          def image_data
            profile_artist
              .artist
              .image_data
          end

          def albums_count
            profile_artist.profile_albums_count
          end

          def tracks_count
            profile_artist.profile_tracks_count
          end
        end
      end
    end
  end
end
