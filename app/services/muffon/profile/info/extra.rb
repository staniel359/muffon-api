module Muffon
  module Profile
    class Info
      class Extra < Muffon::Profile::Info
        def call
          data
        end

        private

        def data
          {
            created: created_formatted,
            playing:,
            online: online?,
            was_online: was_online_formatted,
            library: library_data,
            save_activity_history:
              profile.save_activity_history?
          }.compact
        end

        def created_formatted
          datetime_formatted(
            profile.created_at
          )
        end

        def playing
          return unless online?

          profile.playing
        end

        def online?
          profile.online
        end

        def was_online_formatted
          return if online?

          datetime_formatted(
            was_online
          )
        end

        def was_online
          profile.was_online_at ||
            profile.updated_at
        end

        def library_data
          Muffon::Profile::Library::Info.call(
            profile_id:,
            token: @args[:token],
            other_profile_id:
          ).dig(
            :profile, :library
          )
        end
      end
    end
  end
end
