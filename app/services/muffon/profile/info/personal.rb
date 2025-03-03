module Muffon
  module Profile
    class Info
      class Personal < Muffon::Profile::Info
        def call
          data
        end

        private

        def data
          {
            image:,
            gender:,
            birthdate:,
            country:,
            city:,
            status:
          }.compact_blank
        end

        def image
          profile.image_data
        end

        def gender
          profile.gender
        end

        def birthdate
          profile.birthdate
        end

        def country
          profile.country
        end

        def city
          profile.city
        end

        def status
          profile.status
        end
      end
    end
  end
end
