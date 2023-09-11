module Muffon
  module Profile
    module Post
      class Comments < Muffon::Profile::Base
        COLLECTION_NAME = 'comments'.freeze
        DEFAULT_ORDER = 'created_asc'.freeze

        include Muffon::Utils::Pagination

        private

        def primary_args
          super + [
            @args[:post_id]
          ]
        end

        def no_data?
          super || post.blank?
        end

        def post
          @post ||=
            profile
            .own_posts
            .find_by(
              id: @args[:post_id]
            )
        end

        def data
          { post: paginated_data }
        end

        def total_items_count
          @total_items_count ||= comments.count
        end

        def comments
          @comments ||= post.post_comments
        end

        def collection_list
          comments
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(comment)
          Muffon::Post::Comments::Comment.call(
            comment:
          )
        end
      end
    end
  end
end
