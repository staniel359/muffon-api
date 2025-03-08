module Muffon
  module Processor
    module Profile
      class Updater < Muffon::Processor::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def data
          profile.update(
            update_params
          )

          return profile.errors_data if
              profile.errors?

          process_image

          profile_data
        end

        def update_params
          @args
            .permit!
            .slice(
              *profile_params
            )
        end

        def profile_data
          Muffon::Profile::Info.call(
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
