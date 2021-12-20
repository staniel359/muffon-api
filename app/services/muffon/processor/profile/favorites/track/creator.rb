module Muffon
  module Processor
    module Profile
      module Favorites
        module Track
          class Creator < Muffon::Processor::Profile::Favorites::Base
            include Muffon::Utils::Track

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist_name]
              ]
            end

            def process_favorite
              favorite_track

              return favorite_track.errors_data if
                  favorite_track.errors?

              process_image

              { favorite_id: favorite_track.id }
            end

            def favorite_track
              @favorite_track ||=
                profile.favorite_tracks.where(
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
              favorite_track.process_image(
                @args[:image_url]
              )
            end
          end
        end
      end
    end
  end
end
