module Muffon
  module Utils
    module Global
      private

      def get_global_value(
        key,
        is_refresh: false,
        expires_in_seconds: nil,
        refresh_class_name:
      )
        value = $redis.get(key)

        if value.blank? || is_refresh
          new_value =
            refresh_class_name
              .constantize
              .call

          if expires_in_seconds.present?
            $redis.setex(
              key,
              expires_in_seconds,
              new_value
            )
          else
            $redis.set(
              key,
              new_value
            )
          end
        end

        $redis.get(key)
      end
    end
  end
end
