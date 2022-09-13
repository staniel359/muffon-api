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
              favorite_track.update(
                update_params
              )

              return favorite_track.errors_data if
                  favorite_track.errors?

              process_image

              { favorite_track: favorite_track_data }
            end

            def favorite_track
              @favorite_track ||=
                profile
                .favorite_tracks
                .where(
                  track_id: find_track.id
                ).first_or_initialize
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist_name]
            end

            def update_params
              { album_id: find_album&.id }
            end

            def album_title
              @args[:album_title]
            end

            def process_image
              favorite_track.process_image(
                @args[:image_url]
              )
            end

            def favorite_track_data
              { id: favorite_track.id }
            end
          end
        end
      end
    end
  end
end
