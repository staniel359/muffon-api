module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Creator
            class Track < Muffon::Processor::Profile::Library::Album::Creator
              include Muffon::Utils::Track

              def call
                profile_track
              end

              private

              def profile_track
                profile.profile_tracks.where(
                  track_id: find_track.id
                ).first_or_create(
                  profile_artist_id: profile_artist.id,
                  profile_album_id: @args[:profile_album_id]
                )
              end

              def title
                track['title']
              end

              def track
                @args[:track]
              end

              def profile_artist
                profile.profile_artists.where(
                  artist_id: find_artist.id
                ).first_or_create
              end

              def artist_name
                track.dig(
                  'artist', 'name'
                )
              end
            end
          end
        end
      end
    end
  end
end
