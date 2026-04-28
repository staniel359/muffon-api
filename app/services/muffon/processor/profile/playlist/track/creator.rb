module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Creator < Muffon::Processor::Profile::Playlist::Track::Base
            include Muffon::Mixins::Track

            private

            def required_args
              [
                *super,
                :playlist_id,
                :track_title,
                :artist_name
              ]
            end

            def data
              playlist_track_record

              playlist_track_record.update!(
                artist_id: artist_record.id,
                album_id: album_record&.id,
                source_data: @args[:source],
                audio_data: @args[:audio],
                album_source_data: @args[:album_source],
                created_at: @args[:created]
              )

              playlist_track_record.process_image_later(
                @args[:image]
              )

              {
                playlist: playlist_data,
                playlist_track: playlist_track_data
              }
            end

            def playlist_track_record
              @playlist_track_record ||=
                playlist_record
                .playlist_tracks
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

            def playlist_track_data
              { id: playlist_track_record.id }
            end
          end
        end
      end
    end
  end
end
