module Muffon
  module Processor
    module Profile
      module Favorites
        module Track
          class Destroyer < Muffon::Processor::Profile::Favorites::Base
            private

            def primary_args
              super + [
                @args[:favorite_id]
              ]
            end

            def process_favorite
              favorite_track&.destroy

              { success: true }
            end

            def favorite_track
              @favorite_track ||=
                profile.favorite_tracks.find_by(
                  id: @args[:favorite_id]
                )
            end
          end
        end
      end
    end
  end
end
