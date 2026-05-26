module Muffon
  module Processor
    module Profile
      module Listened
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :listened_id
              ]
            end

            def not_found?
              super || listened_artist_record.blank?
            end

            def listened_artist_record
              if defined?(@listened_artist_record)
                @listened_artist_record
              else
                @listened_artist_record =
                  profile_record
                  .listened_artists
                  .find_by(
                    id: @args[:listened_id]
                  )
              end
            end

            def data
              listened_artist_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
