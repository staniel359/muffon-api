module LastFM
  module Tag
    class Description < LastFM::Tag::API::Base
      private

      def tag_data
        {
          name: title,
          description: description
        }
      end
    end
  end
end
