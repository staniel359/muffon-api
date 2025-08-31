module Muffon
  module Processor
    module Profile
      module Listened
        module Track
          class Destroyer < Muffon::Processor::Profile::Listened::Base
            private

            def required_args
              super + %i[
                listened_id
              ]
            end

            def process_listened
              listened_track&.destroy

              { success: true }
            end

            def listened_track
              if instance_variable_defined?(
                :@listened_track
              )
                @listened_track
              else
                @listened_track =
                  profile
                  .listened_tracks
                  .find_by(
                    id: @args[:listened_id]
                  )
              end
            end
          end
        end
      end
    end
  end
end
