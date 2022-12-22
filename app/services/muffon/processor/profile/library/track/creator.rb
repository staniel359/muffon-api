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

            def forbidden?
              !valid_profile?
            end

            def process_library_track
              update_library_artist
              update_library_album
              update_library_track

              return library_track.errors_data if
                  library_track.errors?

              process_image

              { library_track: library_track_data }
            end

            def update_library_artist
              update_created_at(library_artist)

              library_artist.save
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

            def update_created_at(model)
              return if created_at.blank?

              if model.created_at.present?
                if created_at >= model.created_at
                  model.created_at =
                    created_at
                end
              else
                model.created_at = created_at
              end
            end

            def created_at
              @args[:created]
            end

            def update_library_album
              return if library_album.blank?

              update_created_at(library_album)

              library_album.save
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
              update_created_at(library_track)

              library_track.source_data = source_data
              library_track.audio_data = audio_data
              library_track.album_source_data = album_source_data

              library_track.save
            end

            def library_track
              @library_track ||=
                profile.library_tracks.where(
                  track_id: find_track.id,
                  library_artist_id: library_artist.id,
                  library_album_id: library_album&.id
                ).first_or_initialize
            end

            def source_data
              @args[:source] || library_track.source_data
            end

            def audio_data
              @args[:audio] || library_track.audio_data
            end

            def album_source_data
              @args[:album_source] ||
                library_track.album_source_data
            end

            def title
              @args[:title]
            end

            def process_image
              library_album&.process_image_later(
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
