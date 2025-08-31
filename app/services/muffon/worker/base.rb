module Muffon
  module Worker
    class Base < Muffon::Base
      private

      def worker_args_formatted
        worker_args.to_json
      end
    end
  end
end
