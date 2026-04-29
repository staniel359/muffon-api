module Muffon
  module Formatter
    module Playlist
      class Base < Muffon::Formatter::Base
        private

        def playlist_record
          @args[:playlist_record]
        end

        def id
          playlist_record.id
        end

        def title
          playlist_record.title
        end

        def profile_data
          {
            id: profile_record.id,
            nickname: profile_record.nickname,
            private: profile_record.private
          }
        end

        def profile_record
          playlist_record.profile
        end

        def private?
          playlist_record.private
        end

        def image_data
          playlist_record.image_data
        end

        def description
          return if raw_description.blank?

          CGI.unescapeHTML(
            raw_description
          )
        end

        def raw_description
          playlist_record.description
        end

        def tracks_count
          playlist_record.tracks_count
        end

        def creation_date
          datetime_formatted(
            raw_creation_date
          )
        end

        def raw_creation_date
          playlist_record.created_at
        end

        def playlist_tracks_ids
          if @args[:track_id].present?
            track_playlist_tracks_ids
          elsif @args[:album_id].present?
            album_playlist_tracks_ids
          end
        end

        def track_playlist_tracks_ids
          playlist_record
            .playlist_tracks
            .where(
              track_id: @args[:track_id]
            )
            .pluck(:id)
        end

        def album_playlist_tracks_ids
          playlist_record
            .playlist_tracks
            .where(
              album_id: @args[:album_id]
            )
            .pluck(:id)
        end
      end
    end
  end
end
