module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Track
          class Creator < Muffon::Processor::Profile::Bookmarks::Base
            include Muffon::Utils::Track

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist]
              ]
            end

            def process_bookmark
              bookmark_track.update(
                update_params
              )

              return bookmark_track.errors_data if
                  bookmark_track.errors?

              process_image

              {
                bookmark_track:
                  bookmark_track_data
              }
            end

            def bookmark_track
              @bookmark_track ||=
                profile
                .bookmark_tracks
                .where(
                  track_id: find_track.id
                ).first_or_initialize
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist]
            end

            def update_params
              {
                album_id: find_album&.id,
                source_data: @args[:source],
                audio_data: @args[:audio],
                album_source_data:
                  @args[:album_source]
              }
            end

            def album_title
              @args[:album]
            end

            def process_image
              bookmark_track.process_image(
                @args[:image]
              )
            end

            def bookmark_track_data
              { id: bookmark_track.id }
            end
          end
        end
      end
    end
  end
end
