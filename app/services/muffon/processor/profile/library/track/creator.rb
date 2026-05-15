module Muffon
  module Processor
    module Profile
      module Library
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
              library_artist_record

              update_library_artist_record!

              library_album_record

              update_library_album_record!

              library_album_record&.process_image_later(
                @args[:image]
              )

              library_track_record

              update_library_track_record!

              { library_track: library_track_data }
            end

            def library_artist_record
              @library_artist_record ||=
                profile_record
                .library_artists
                .where(
                  artist_id: artist_record.id
                )
                .first_or_initialize
            end

            def artist_name
              @args[:artist_name].presence || 'Unknown Artist'
            end

            def update_library_artist_record!
              update_model_creation_date(
                model: library_artist_record
              )

              library_artist_record.save!
            end

            def update_model_creation_date(
              model:
            )
              return unless update_model_creation_date?(model:)

              model.created_at = @args[:created]
            end

            def update_model_creation_date?(
              model:
            )
              @args[:created].present? && (
                model.created_at.blank? ||
                  @args[:created] < model.created_at
              )
            end

            def library_album_record
              return if album_title.blank?

              @library_album_record ||=
                profile_record
                .library_albums
                .where(
                  album_id: album_record.id,
                  library_artist_id: library_artist_record.id
                )
                .first_or_initialize
            end

            def album_title
              @args[:album_title]
            end

            def update_library_album_record!
              return if library_album_record.blank?

              update_model_creation_date(
                model: library_album_record
              )

              library_album_record.source_data = @args[:album_source]

              library_album_record.save!
            end

            def library_track_record
              @library_track_record ||=
                profile_record
                .library_tracks
                .where(
                  track_id: track_record.id,
                  library_artist_id: library_artist_record.id,
                  library_album_id: library_album_record&.id
                )
                .first_or_initialize
            end

            def title
              @args[:track_title]
            end

            def update_library_track_record!
              update_model_creation_date(
                model: library_track_record
              )

              library_track_record.source_data = @args[:source]

              library_track_record.audio_data = @args[:audio]

              library_track_record.save!
            end

            def library_track_data
              { id: library_track_record.id }
            end
          end
        end
      end
    end
  end
end
