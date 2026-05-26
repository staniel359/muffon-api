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

            def not_found?
              super || favorite_album_record.blank?
            end

            def favorite_album_record
              if defined?(@favorite_album_record)
                @favorite_album_record
              else
                @favorite_album_record =
                  profile_record
                  .favorite_albums
                  .find_by(
                    id: @args[:favorite_id]
                  )
              end
            end

            def data
              favorite_album_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
