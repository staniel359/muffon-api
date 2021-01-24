module LastFM
  module Tag
    class Description < LastFM::Tag::API::Base
      private

      def tag_data
        {
          name: response_data['name'],
          description: description
        }
      end
    end
  end
end
