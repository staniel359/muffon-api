module Muffon
  module Processor
    module Profile
      module Library
        module Track
          class Creator < Muffon::Processor::Profile::Library::Track::Base
            include Muffon::Utils::Track

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist]
              ]
            end

            def process_library_track
              return forbidden if wrong_profile?

              update_library_artist
              update_library_album
              update_library_track

              return library_track.errors_data if
                  library_track.errors?

              process_image

              { library_track: library_track_data }
            end

            def update_library_artist
              library_artist.tap do |artist|
                artist.created_at = created_at if
                    update_created_at?(artist)
                artist.save
              end
            end

            def library_artist
              @library_artist ||=
                profile.library_artists.where(
                  artist_id: find_artist.id
                ).first_or_initialize
            end

            def artist_name
              @args[:artist]
            end

            def update_created_at?(model)
              return false if created_at.blank?
              return true if model.created_at.blank?

              created_at < model.created_at
            end

            def created_at
              @args[:created]
            end

            def update_library_album
              return if library_album.blank?

              library_album.tap do |album|
                album.created_at = created_at if
                    update_created_at?(album)
                album.save
              end
            end

            def library_album
              return if album_title.blank?

              @library_album ||=
                profile.library_albums.where(
                  album_id: find_album.id,
                  library_artist_id: library_artist.id
                ).first_or_initialize
            end

            def album_title
              @args[:album]
            end

            def update_library_track
              library_track.tap do |track|
                track.created_at = created_at if
                    update_created_at?(track)
                track.save
              end
            end

            def library_track
              @library_track ||=
                profile.library_tracks.where(
                  track_id: find_track.id,
                  library_artist_id: library_artist.id,
                  library_album_id: library_album&.id
                ).first_or_initialize
            end

            def title
              @args[:title]
            end

            def process_image
              library_album&.process_image(
                @args[:image]
              )
            end

            def library_track_data
              { id: library_track.id }
            end
          end
        end
      end
    end
  end
end
