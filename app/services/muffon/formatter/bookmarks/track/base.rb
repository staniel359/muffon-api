module Muffon
  module Formatter
    module Bookmarks
      module Track
        class Base < Muffon::Formatter::Track::Base
          private

          def track_record
            @track_record ||= bookmark_track_record.track
          end

          def bookmark_track_record
            @args[:bookmark_track_record]
          end

          def source_data
            bookmark_track_record
              .source_data
              &.deep_symbolize_keys
          end

          def id
            bookmark_track_record.id
          end

          def album_record
            @album_record ||= bookmark_track_record.album
          end

          def album_source_data
            bookmark_track_record
              .album_source_data
              &.deep_symbolize_keys
          end

          def image_data
            bookmark_track_record.image_data
          end

          def audio_data
            bookmark_track_record
              .audio_data
              &.deep_symbolize_keys
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            bookmark_track_record.created_at
          end
        end
      end
    end
  end
end
