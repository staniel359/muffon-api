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
          profile_record

          if profile_record.errors?
            profile_record.errors_data
          else
            profile_record.process_image(
              @args[:image]
            )

            authenticate
          end
        end

        def profile_record
          @profile_record ||=
            ::Profile.create(
              record_attributes
            )
        end

        def record_attributes
          @args.slice(
            *profile_params
          )
        end

        def authenticate
          Muffon::Profile::Authenticator.call(
            authenticate_params
          )
        end

        def authenticate_params
          profile_record.slice(
            *Muffon::Profile::Authenticator::PARAMS
          )
        end
      end
    end
  end
end
