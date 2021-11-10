module Muffon
  module Profile
    module Library
      class Albums
        class Album
          class Creator
            class Track < Muffon::Profile::Library::Albums::Album::Creator
              include Muffon::Utils::Track

              def call
                process_track
              end

              private

              def process_track
                profile.profile_tracks.where(
                  track_id: find_track.id
                ).first_or_create(
                  profile_artist_id: profile_artist.id,
                  profile_album_id: @args.profile_album_id
                )
              end

              def title
                @args.track['title']
              end

              def artist_name
                @args.track.dig(
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
end
