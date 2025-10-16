module YouTube
  module Utils
    module Base
      VERSION_PARAM = '1.20250924.03.00'.freeze

      private

      def context_data
        { client: client_data }
      end

      def client_data
        {
          'clientName' => 'WEB_REMIX',
          'clientVersion' => VERSION_PARAM,
          'gl' => 'GB'
        }
      end
    end
  end
end
