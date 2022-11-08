module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Creator
            class Track < Muffon::Processor::Profile::Library::Album::Creator
              include Muffon::Utils::Track

              def call
                data
              end

              private

              def data
                process_library_track
              end

              def process_library_track
                library_track.source_data = source_data
                library_track.audio_data = audio_data
                library_track.album_source_data = album_source_data

                library_track.save
              end

              def library_track
                @library_track ||=
                  profile
                  .library_tracks
                  .where(
                    track_id: find_track.id,
                    library_artist_id: library_artist.id,
                    library_album_id: @args[:library_album_id]
                  ).first_or_initialize
              end

              def title
                track['title']
              end

              def track
                @args[:track]
              end

              def library_artist
                profile
                  .library_artists
                  .where(
                    artist_id: find_artist.id
                  ).first_or_create
              end

              def artist_name
                track.dig(
                  'artist', 'name'
                )
              end

              def source_data
                track[:source] ||
                  library_track.source_data
              end

              def audio_data
                track[:audio] ||
                  library_track.audio_data
              end

              def album_source_data
                track[:album_source] ||
                  library_track.album_source_data
              end
            end
          end
        end
      end
    end
  end
end
