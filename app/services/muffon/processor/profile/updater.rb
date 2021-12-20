module Muffon
  module Processor
    module Profile
      class Updater < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def data
          return forbidden if wrong_profile?

          profile.update(
            update_params
          )

          return profile.errors_data if
              profile.errors?

          process_image

          { profile: profile_data }
        end

        def update_params
          @args.permit!.slice(
            *profile_params
          )
        end

        def profile_data
          Muffon::Profiles::Profile.call(
            profile: profile,
            token: @args[:token]
          )
        end
      end
    end
  end
end
