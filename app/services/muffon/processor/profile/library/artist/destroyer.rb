module Muffon
  module Processor
    module Profile
      module Library
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :library_id
              ]
            end

            def not_found?
              super || library_artist_record.blank?
            end

            def library_artist_record
              if defined?(@library_artist_record)
                @library_artist_record
              else
                @library_artist_record =
                  profile_record
                  .library_artists
                  .find_by(
                    id: @args[:library_id]
                  )
              end
            end

            def data
              library_artist_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
