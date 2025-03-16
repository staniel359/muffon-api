module Muffon
  module Utils
    module Base
      private

      def secrets
        Rails.application.credentials
      end

      def current_time
        Time.now.utc
      end

      def test?
        Rails.env.test?
      end

      def production?
        Rails.env.production?
      end

      def source_name
        self.class::SOURCE_NAME
      end
    end
  end
end
