module Muffon
  module Processor
    module Profile
      module Listened
        module Artist
          class Destroyer < Muffon::Processor::Profile::Listened::Base
            private

            def required_args
              super + %i[
                listened_id
              ]
            end

            def process_listened
              listened_artist&.destroy

              { success: true }
            end

            def listened_artist
              if instance_variable_defined?(
                :@listened_artist
              )
                @listened_artist
              else
                @listened_artist =
                  profile
                  .listened_artists
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
