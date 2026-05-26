module Muffon
  module Processor
    module Profile
      module Favorites
        module Track
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :favorite_id
              ]
            end

            def not_found?
              super || favorite_track_record.blank?
            end

            def favorite_track_record
              if defined?(@favorite_track_record)
                @favorite_track_record
              else
                @favorite_track_record =
                  profile_record
                  .favorite_tracks
                  .find_by(
                    id: @args[:favorite_id]
                  )
              end
            end

            def data
              favorite_track_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
