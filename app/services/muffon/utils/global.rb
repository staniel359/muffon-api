module Muffon
  module Utils
    module Global
      REDIS = Redis.new

      def get_global_value(key)
        update_global_value(key) if REDIS.get(key).blank?

        REDIS.get(key)
      end

      def update_global_value(key)
        REDIS.set(key, global_value)
      end
    end
  end
end
