module Muffon
  module Processor
    module Profile
      module Favorites
        module Album
          class Destroyer < Muffon::Processor::Profile::Favorites::Base
            private

            def primary_args
              super + [
                @args[:favorite_id]
              ]
            end

            def process_favorite
              favorite_album&.destroy

              { success: true }
            end

            def favorite_album
              @favorite_album ||=
                profile.favorite_albums.find_by(
                  id: @args[:favorite_id]
                )
            end
          end
        end
      end
    end
  end
end
