module Muffon
  module Profile
    module Messages
      class Message < Muffon::Profile::Base
        def call
          data
        end

        private

        def data
          {
            content: message.content,
            profile: profile_data,
            images:,
            artists:,
            albums:,
            tracks:,
            created: created_formatted
          }.compact
        end

        def message
          @args[:message]
        end

        def profile_data
          {
            id: message_profile.id,
            nickname: message_profile.nickname,
            image: message_profile.image_data
          }
        end

        def message_profile
          @message_profile ||= message.profile
        end

        def images
          message.images_data
        end

        def artists_list
          message.artists
        end

        def artist_data_formatted(artist)
          Muffon::Sendable::Artist.call(
            artist:
          )
        end

        def albums_list
          message.albums
        end

        def album_data_formatted(album)
          Muffon::Sendable::Album.call(
            album:
          )
        end

        def tracks_list
          message.tracks
        end

        def track_data_formatted(track)
          Muffon::Sendable::Track.call(
            track:
          )
        end

        def created_formatted
          datetime_formatted(
            message.created_at
          )
        end
      end
    end
  end
end
