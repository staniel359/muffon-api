module YouTube
  module Channel
    class Links < YouTube::Channel::Info
      private

      def channel_data
        { links: source_links }
      end
    end
  end
end
