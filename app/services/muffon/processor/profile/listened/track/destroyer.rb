module Muffon
  module Processor
    module Profile
      module Listened
        module Track
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :listened_id
              ]
            end

            def not_found?
              super || listened_track_record.blank?
            end

            def listened_track_record
              if defined?(@listened_track_record)
                @listened_track_record
              else
                @listened_track_record =
                  profile_record
                  .listened_tracks
                  .find_by(
                    id: @args[:listened_id]
                  )
              end
            end

            def data
              listened_track_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
