module Muffon
  module Formatter
    module Profile
      class Info < Muffon::Formatter::Profile::Base
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
            **base_data,
            **extra_data,
            **counters_data
          }.compact
        end

        def base_data
          {
            id:,
            nickname:,
            email:,
            role:,
            private: private?,
            image: image_data
          }
        end

        def extra_data
          {
            gender:,
            birthdate:,
            country:,
            city:,
            status:,
            other_profile: other_profile_data,
            created: creation_date,
            playing:,
            online: online?,
            was_online: online_presence_date,
            library: library_data,
            save_activity_history: save_activity_history?,
            connections: connections_data
          }
        end

        def counters_data
          {
            followers_count:,
            following_count:,
            posts_count:,
            playlists_count:,
            communities_count:,
            favorites: favorites_data
          }
        end
      end
    end
  end
end
