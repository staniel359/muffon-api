module Muffon
  module Processor
    module Profile
      module Favorites
        module Album
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :favorite_id
              ]
            end

            def data
              favorite_album_record.destroy!

              { success: true }
            end

            def favorite_album_record
              profile_record
                .favorite_albums
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
