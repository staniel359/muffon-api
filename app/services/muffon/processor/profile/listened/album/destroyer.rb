module Muffon
  module Processor
    module Profile
      module Listened
        module Album
          class Destroyer < Muffon::Processor::Profile::Listened::Base
            private

            def primary_args
              super + [
                @args[:listened_id]
              ]
            end

            def process_listened
              listened_album&.destroy

              { success: true }
            end

            def listened_album
              if instance_variable_defined?(
                :@listened_album
              )
                @listened_album
              else
                @listened_album =
                  profile
                  .listened_albums
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
