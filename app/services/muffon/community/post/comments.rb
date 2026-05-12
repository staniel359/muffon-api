module Muffon
  module Community
    module Post
      class Comments < Muffon::Community::Base
        DEFAULT_ORDER = 'created_asc'.freeze

        private

        def required_args
          [
            *super,
            :post_id
          ]
        end

        def post_record
          if defined?(@post_record)
            @post_record
          else
            @post_record =
              community_record
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
            .with_relations
        end

        def comments
          @comments ||= post_record.post_comments
        end

        def items_count
          comments.count
        end

        def collection_item_data_formatted(
          comment_record
        )
          Muffon::Formatter::Post::Comments::Comment.call(
            comment_record:,
            **self_args
          )
        end
      end
    end
  end
end
