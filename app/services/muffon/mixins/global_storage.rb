module Muffon
  module Mixins
    module GlobalStorage
      private

      def get_global_value(
        key,
        refresh_class_name:,
        is_refresh: false,
        expires_in_seconds: nil,
        type: 'string'
      )
        value = REDIS.get(key)

        if value.blank? || is_refresh
          new_value =
            refresh_class_name
            .constantize
            .call

          new_value = new_value.to_json if type == 'hash'

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
