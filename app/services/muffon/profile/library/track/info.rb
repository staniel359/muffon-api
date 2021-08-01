module Muffon
  module Profile
    module Library
      module Track
        class Info < Muffon::Profile::Library::Track::Base
          private

          def track_data
            {
              title: title,
              player_id: player_id,
              artist: artist_data,
              album: album_data,
              image: image_data,
              created: created
            }
          end

          def player_id
            profile_track
              .track
              .player_id
          end

          def album_data
            return {} if profile_album.blank?

            {
              id: album_id,
              title: album_title
            }
          end

          def profile_album
            @profile_album ||=
              profile_track.profile_album
          end

          def album_id
            profile_track.profile_album_id
          end

          def album_title
            profile_album
              .album
              .title
          end

          def image_data
            return image_url_data if no_image?

            {
              original: image,
              large: image(600),
              medium: image(300),
              small: image(100),
              extrasmall: image(50)
            }
          end

          def no_image?
            profile_album&.image.blank?
          end

          def image(size = nil)
            profile_album&.stored_image_url(size)
          end

          def image_url_data
            LastFM::Utils::Image.call(
              model: 'track',
              image: profile_album&.image_url
            )
          end

          def created
            datetime_formatted(
              profile_track.created_at
            )
          end
        end
      end
    end
  end
end
