module YouTube
  module Search
    class Channels < YouTube::Search::Base
      COLLECTION_NAME = 'channels'.freeze
      MODEL_NAME = 'channel'.freeze

      private

      def collection_item_data_formatted(channel)
        YouTube::Search::Channels::Channel.call(
          channel:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
