module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Destroyer < Muffon::Processor::Profile::Playlist::Track::Base
            private

            def required_args
              [
                *super,
                :playlist_track_id
              ]
            end

            def not_found?
              super || playlist_track_record.blank?
            end

            def playlist_track_record
              if defined?(@playlist_track_record)
                @playlist_track_record
              else
                @playlist_track_record =
                  playlist_record
                  .playlist_tracks
                  .find_by(
                    id: @args[:playlist_track_id]
                  )
              end
            end

            def data
              playlist_track_record.destroy!

              { playlist: playlist_data }
            end
          end
        end
      end
    end
  end
end
