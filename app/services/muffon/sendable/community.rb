module Muffon
  module Sendable
    class Community < Muffon::Base
      def call
        data
      end

      private

      def data
        return {} if find_community.blank?

        {
          id: find_community.id,
          title: find_community.title,
          image: image_data,
          description:
            find_community.description,
          members_count:
            find_community.members_count
        }.compact
      end

      def find_community
        @find_community ||=
          ::Community.find_by(
            id: community[:id]
          )
      end

      def community
        @args[:community].deep_symbolize_keys
      end

      def image_data
        find_community
          .image_data
          &.slice(
            :extrasmall
          )
      end
    end
  end
end
