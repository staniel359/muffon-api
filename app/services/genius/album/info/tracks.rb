module Genius
  module Album
    class Info
      class Tracks < Genius::Album::Info
        private

        def no_data?
          tracks_list.blank?
        end

        def tracks_list
          @tracks_list ||= response_data.dig(
            'response', 'tracks'
          )
        end

        def link
          "#{super}/tracks"
        end

        def data
          { tracks: tracks }
        end

        def tracks
          tracks_list.map do |t|
            track_data_formatted(t)
          end
        end

        def track_data_formatted(track)
          Genius::Album::Info::Tracks::Track.call(
            track: track['song'],
            profile_id: @args[:profile_id]
          )
        end
      end
    end
  end
end
