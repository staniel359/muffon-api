module Muffon
  module Community
    module Post
      class Comments < Muffon::Community::Base
        DEFAULT_ORDER = 'created_asc'.freeze

        private

        def required_args
          super + %i[
            post_id
          ]
        end

        def not_found?
          super ||
            post.blank?
        end

        def post
          if instance_variable_defined?(:@post)
            @post
          else
            @post =
              community
              .posts
              .find_by(
                id: @args[:post_id]
              )
          end
        end

        def data
          { post: comments_data }
        end

        def comments_data
          paginated_data(
            collection_name: 'comments',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          comments
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def comments
          @comments ||= post.post_comments
        end

        def items_count
          comments.count
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
