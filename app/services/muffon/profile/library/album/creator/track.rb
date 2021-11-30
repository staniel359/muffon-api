module Muffon
  module Profile
    module Library
      module Album
        class Creator
          class Track < Muffon::Profile::Library::Album::Creator
            include Muffon::Utils::Track

            def call
              process_track
            end

            private

            def process_track
              profile_track.tap do |track|
                track.profile_artist_id = profile_artist.id
                track.profile_album_id = @args[:profile_album_id]
                track.save
              end
            end

            def profile_track
              profile.profile_tracks.where(
                track_id: find_track.id
              ).first_or_initialize
            end

            def title
              track['title']
            end

            def track
              @args[:track]
            end

            def artist_name
              track.dig(
                'artist', 'name'
              )
            end

            def profile_artist
              profile.profile_artists.where(
                artist_id: find_artist.id
              ).first_or_create
            end
          end
        end
      end
    end
  end
end
