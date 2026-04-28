module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Track
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Mixins::Track

            private

            def required_args
              [
                *super,
                :track_title,
                :artist_name
              ]
            end

            def data
              bookmark_track_record

              bookmark_track_record.update!(
                album_id: album_record&.id,
                source_data: @args[:source],
                audio_data: @args[:audio],
                album_source_data: @args[:album_source]
              )

              bookmark_track_record.process_image_later(
                @args[:image]
              )

              { bookmark_track: bookmark_track_data }
            end

            def bookmark_track_record
              @bookmark_track_record ||=
                profile_record
                .bookmark_tracks
                .where(
                  track_id: track_record.id
                )
                .first_or_initialize
            end

            def title
              @args[:track_title]
            end

            def artist_name
              @args[:artist_name]
            end

            def album_title
              @args[:album_title]
            end

            def bookmark_track_data
              { id: bookmark_track_record.id }
            end
          end
        end
      end
    end
  end
end
