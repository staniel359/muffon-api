module Muffon
  module Processor
    module Profile
      module Favorites
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :favorite_id
              ]
            end

            def data
              favorite_artist_record.destroy!

              { success: true }
            end

            def favorite_artist_record
              profile_record
                .favorite_artists
                .find_by(
                  id: @args[:favorite_id]
                )
            end
          end
        end
      end
    end
  end
end
