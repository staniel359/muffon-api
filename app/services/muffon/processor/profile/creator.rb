module Muffon
  module Processor
    module Profile
      class Creator < Muffon::Processor::Profile::Base
        private

        def primary_args
          [
            @args[:email],
            @args[:password],
            @args[:password_confirmation],
            @args[:nickname],
            @args[:recaptcha]
          ]
        end

        def forbidden?
          false
        end

        def data
          profile

          check_recaptcha

          return profile.errors_data if
              profile.errors?

          process_image

          set_online

          authenticate
        end

        def profile
          @profile ||=
            ::Profile.create(
              create_params
            )
        end

        def create_params
          @args.permit!.slice(
            *profile_params
          )
        end

        def set_online
          ::Muffon::Processor::Profile::Online::Updater.call(
            profile_id: profile.id,
            token: profile.token,
            online: 1
          )
        end

        def authenticate
          Muffon::Profile::Authenticator.call(
            authenticate_params
          )
        end

        def authenticate_params
          profile.slice(
            *Muffon::Profile::Authenticator::PARAMS
          )
        end
      end
    end
  end
end
