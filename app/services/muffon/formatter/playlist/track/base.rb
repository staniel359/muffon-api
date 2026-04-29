module Muffon
  module Formatter
    module Playlist
      module Track
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Track

          private

          def track_record
            @track_record ||= playlist_track_record.track
          end

          def playlist_track_record
            @args[:playlist_track_record]
          end

          def source_data
            playlist_track_record
              .source_data
              &.deep_symbolize_keys
          end

          def id
            playlist_track_record.id
          end

          def title
            track_record.title
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_record.name }
          end

          def artist_record
            playlist_track_record.artist
          end

          def album_data
            return if album_record.blank?

            {
              source: album_source_data,
              title: album_record.title
            }
          end

          def album_record
            @album_record ||= playlist_track_record.album
          end

          def album_source_data
            playlist_track_record
              .album_source_data
              &.deep_symbolize_keys
          end

          def image_data
            playlist_track_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            playlist_track_record.created_at
          end

          def audio_data
            playlist_track_record
              .audio_data
              &.deep_symbolize_keys
          end
        end
      end
    end
  end
end
