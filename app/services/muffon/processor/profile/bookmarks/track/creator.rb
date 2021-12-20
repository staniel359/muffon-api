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
                @args[:artist_name]
              ]
            end

            def process_bookmark
              bookmark_track

              return bookmark_track.errors_data if
                  bookmark_track.errors?

              process_image

              { bookmark_id: bookmark_track.id }
            end

            def bookmark_track
              @bookmark_track ||=
                profile.bookmark_tracks.where(
                  track_id: find_track.id
                ).first_or_create(
                  album_id: find_album&.id
                )
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist_name]
            end

            def album_title
              @args[:album_title]
            end

            def process_image
              bookmark_track.process_image(
                @args[:image_url]
              )
            end
          end
        end
      end
    end
  end
end
