module LastFM
  module Connect
    module Session
      class Base < LastFM::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def no_data?
          profile.blank?
        end

        def data
          return forbidden if wrong_profile?

          process_profile
        end

        def wrong_profile?
          profile.token != @args[:token]
        end
      end
    end
  end
end
