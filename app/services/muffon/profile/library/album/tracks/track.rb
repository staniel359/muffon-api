module Muffon
  module Profile
    module Library
      module Album
        class Tracks
          class Track < Muffon::Profile::Library::Album::Tracks
            include Muffon::Utils::Track

            def call
              data
            end

            private

            def data
              {
                id: id,
                track_id: track_id,
                favorite_id: favorite_id,
                player_id: player_id,
                title: title,
                created: created
              }
            end

            def id
              profile_track.id
            end

            def profile_track
              @profile_track ||= @args.track
            end

            def track_id
              profile_track.track_id
            end

            def artist_name
              profile_track
                .track
                .artist
                .name
            end

            def player_id
              profile_track
                .track
                .player_id
            end

            def title
              profile_track
                .track
                .title
            end

            def created
              datetime_formatted(
                profile_track.created_at
              )
            end
          end
        end
      end
    end
  end
end
