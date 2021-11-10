module Muffon
  module Profile
    module Library
      class Tracks
        class Track < Muffon::Profile::Library::Tracks
          include Muffon::Utils::Track

          def call
            data
          end

          private

          def data
            track_base_data
              .merge(track_extra_data)
          end

          def track_base_data
            {
              id: id,
              favorite_id: favorite_id,
              player_id: player_id,
              title: title,
              artist: artist_data
            }.compact
          end

          def id
            profile_track.id
          end

          def profile_track
            @profile_track ||= @args.track
          end

          def player_id
            profile_track
              .track
              .player_id
          end

          def title
            profile_track
              .track
              .title
          end

          def artist_data
            {
              id: artist_id,
              name: artist_name
            }
          end

          def artist_id
            profile_track.profile_artist_id
          end

          def artist_name
            profile_track
              .profile_artist
              .artist
              .name
          end

          def track_extra_data
            {
              album: album_data,
              image: image_data,
              created: created_at
            }
          end

          def album_data
            return if profile_album.blank?

            {
              id: album_id,
              title: album_title
            }
          end

          def album_id
            profile_track.profile_album_id
          end

          def album_title
            profile_album
              .album
              .title
          end

          def profile_album
            @profile_album ||=
              profile_track.profile_album
          end

          def image_data
            profile_album&.image_data.presence ||
              default_image_data
          end

          def default_image_data
            ::LastFM::Utils::Image.call(
              model: 'track',
              image: profile_album&.image_url
            )
          end

          def created_at
            datetime_formatted(
              profile_track.created_at
            )
          end
        end
      end
    end
  end
end
