module Muffon
  module Profile
    module Library
      module Artist
        class Tracks
          class Track < Muffon::Profile::Library::Artist::Tracks
            def call
              data
            end

            private

            def data
              {
                id: id,
                player_id: player_id,
                title: title,
                album: album_data,
                image: image_data,
                created: created
              }
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

            def album_data
              return {} if profile_album.blank?

              {
                id: profile_album.id,
                title: profile_album.album.title
              }
            end

            def profile_album
              @profile_album ||=
                profile_track.profile_album
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
                model: 'album',
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
end
