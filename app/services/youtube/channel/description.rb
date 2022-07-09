module YouTube
  module Channel
    class Description < YouTube::Channel::Info
      private

      def channel_data
        { description: }
      end
    end
  end
end
