module Muffon
  module Formatter
    module Library
      module Track
        class Base < Muffon::Formatter::Track::Base
          private

          def track_record
            @track_record ||= library_track_record.track
          end

          def library_track_record
            @args[:library_track_record]
          end

          def source_data
            library_track_record
              .source_data
              &.deep_symbolize_keys
          end

          def library_track_data
            {
              id: library_track_record.id,
              artist: library_artist_data,
              album: library_album_data
            }.compact
          end

          def library_artist_data
            { id: library_artist_record.id }
          end

          def library_artist_record
            library_track_record.library_artist
          end

          def library_album_data
            return if library_album_record.blank?

            { id: library_album_record.id }
          end

          def library_album_record
            @library_album_record ||=
              library_track_record.library_album
          end

          def album_data
            return if library_album_record.blank?

            super
          end

          def album_source_data
            library_album_record
              .source_data
              &.deep_symbolize_keys
          end

          def album_record
            library_album_record.album
          end

          def image_data
            library_album_record&.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            library_track_record.created_at
          end

          def audio_data
            library_track_record
              .audio_data
              &.deep_symbolize_keys
          end

          def albums_count
            library_track_record
              .library_albums
              .count
          end

          def playlists_count
            library_track_record.playlists_count
          end
        end
      end
    end
  end
end
