module Muffon
  module Processor
    module Profile
      module Favorites
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
              favorite_track_record

              favorite_track_record.update!(
                album_id: album_record&.id,
                source_data: @args[:source],
                audio_data: @args[:audio],
                album_source_data: @args[:album_source],
                created_at: @args[:created]
              )

              favorite_track_record.process_image_later(
                @args[:image]
              )

              { favorite_track: favorite_track_data }
            end

            def favorite_track_record
              @favorite_track_record ||=
                profile_record
                .favorite_tracks
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

            def favorite_track_data
              { id: favorite_track_record.id }
            end
          end
        end
      end
    end
  end
end
