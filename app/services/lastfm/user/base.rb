module LastFM
  module User
    class Base < LastFM::Base
      private

      def primary_args
        [@args[:nickname]]
      end

      def params
        super.merge(user_params)
      end

      def user_params
        { user: @args[:nickname] }
      end

      def data
        { user: user_data }
      end
    end
  end
end
