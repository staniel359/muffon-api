module Muffon
  module Formatter
    module Profiles
      class Profile < Muffon::Formatter::Profile::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            profile_record
          ]
        end

        def data
          {
            id:,
            nickname:,
            role:,
            private: private?,
            image: image_data,
            gender:,
            birthdate:,
            country:,
            city:,
            status:,
            created: creation_date,
            online: online?,
            playing:,
            other_profile: other_profile_data,
            followers_count:,
            following_count:
          }.compact
        end
      end
    end
  end
end
