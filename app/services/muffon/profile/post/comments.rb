module Muffon
  module Profile
    module Post
      class Comments < Muffon::Profile::Base
        COLLECTION_NAME = 'comments'.freeze
        DEFAULT_ORDER = 'created_asc'.freeze

        include Muffon::Utils::Pagination

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
          if instance_variable_defined?(
            :@post
          )
            @post
          else
            @post =
              profile
              .own_posts
              .find_by(
                id: @args[:post_id]
              )
          end
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
