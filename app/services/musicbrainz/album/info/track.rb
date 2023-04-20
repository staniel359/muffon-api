module MusicBrainz
  module Album
    class Info
      class Track < MusicBrainz::Album::Info
        include MusicBrainz::Utils::Track

        def call
          data
        end

        private

        def data
          self_data
            .merge(track_data)
        end

        def track
          @args[:track]
        end

        def track_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artist_names_data,
            artists:,
            duration:
          }
        end
      end
    end
  end
end