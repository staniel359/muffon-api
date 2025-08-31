module Spec
  module Helpers
    module Base
      RANDOM_STRING = 'wejlhg239gh23'.freeze
      CLIENT_VERSION = '2.3.0'.freeze

      include Muffon::Utils::Errors

      private

      def random_string
        RANDOM_STRING
      end

      def required_params
        {
          token:,
          version: CLIENT_VERSION
        }
      end

      def token
        credentials[:tokens].first
      end

      def credentials
        Rails
          .application
          .credentials
      end
    end
  end
end
