module LastFM
  module Multitag
    class Base < LastFM::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          tags
        ]
      end

      def data
        { multitag: multitag_data }
      end
    end
  end
end
