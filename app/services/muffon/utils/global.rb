module Muffon
  module Utils
    module Global
      REDIS = Redis.new

      def get_global_value(
        key,
        expires_in: nil
      )
        if REDIS.get(key).blank?
          update_global_value(
            key,
            expires_in:
          )
        end

        REDIS.get(key)
      end

      def update_global_value(
        key,
        expires_in: nil
      )
        if expires_in.present?
          REDIS.setex(
            key, expires_in, global_value
          )
        else
          REDIS.set(
            key, global_value
          )
        end
      end
    end
  end
end
