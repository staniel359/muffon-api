module Muffon
  module Utils
    module Global
      private

      def get_global_value(
        key,
        refresh_class_name:,
        is_refresh: false,
        expires_in_seconds: nil
      )
        value = REDIS.get(key)

        if value.blank? || is_refresh
          new_value =
            refresh_class_name
            .constantize
            .call

          if expires_in_seconds.present?
            REDIS.setex(
              key,
              expires_in_seconds,
              new_value
            )
          else
            REDIS.set(
              key,
              new_value
            )
          end
        end

        REDIS.get(key)
      end
    end
  end
end
