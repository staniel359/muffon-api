module Muffon
  module Profile
    module Favorites
      class Tracks
        class Track < Muffon::Profile::Favorites::Tracks
          include Muffon::Utils::Track

          def call
            data
          end

          private

          def data
            muffon_data
              .merge(favorite_track_data)
          end

          def title
            track.title
          end

          def track
            @track ||= favorite_track.track
          end

          def favorite_track
            @args[:favorite_track]
          end

          def artist_name
            artist.name
          end

          def artist
            track.artist
          end

          def favorite_track_data
            {
              id: favorite_track.id,
              player_id: track.player_id,
              title:,
              artist: artist_names_data,
              artists:,
              album: album_data,
              image: favorite_track.image_data
            }.compact
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end

          def album_data
            return if album.blank?

            { title: album.title }
          end

          def album
            @album ||= favorite_track.album
          end
        end
      end
    end
  end
end
