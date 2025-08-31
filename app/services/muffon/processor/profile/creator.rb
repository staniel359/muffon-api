module Muffon
  module Processor
    module Profile
      class Creator < Muffon::Processor::Profile::Base
        private

        def required_args
          %i[
            email
            password
            password_confirmation
            nickname
          ]
        end

        def forbidden?
          false
        end

        def data
          profile

          if profile.errors?
            profile.errors_data
          else
            process_image

            set_online

            authenticate
          end
        end

        def profile
          @profile ||=
            ::Profile.create(
              create_params
            )
        end

        def create_params
          @args.slice(
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
