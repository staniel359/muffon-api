module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Creator
            class Track < Muffon::Processor::Profile::Library::Album::Creator
              include Muffon::Utils::Track

              def call
                library_track
              end

              private

              def library_track
                profile.library_tracks.where(
                  track_id: find_track.id,
                  library_artist_id: library_artist.id,
                  library_album_id: @args[:library_album_id]
                ).first_or_create
              end

              def title
                track['title']
              end

              def track
                @args[:track]
              end

              def library_artist
                profile.library_artists.where(
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
