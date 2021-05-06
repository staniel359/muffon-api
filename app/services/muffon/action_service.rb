module Muffon
  class ActionService < Muffon::Base
    def call
      data
    end

    private

    def data
      new_controller_action.camelize.safe_constantize
    end

    def new_controller_action
      exception_actions[controller_action] ||
        controller_action
    end

    def exception_actions
      {
        'lastfm/artist/tags' => 'lastfm/common/tags',
        'lastfm/album/tags' => 'lastfm/common/tags',
        'lastfm/track/tags' => 'lastfm/common/tags'
      }
    end

    def controller_action
      [new_controller, action].join('/')
    end

    def new_controller
      exception_controllers[controller] || controller
    end

    def exception_controllers
      {
        'lastfm/artist/album' => 'lastfm/album',
        'lastfm/artist/track' => 'lastfm/track',
        'spotify/artist/album' => 'spotify/album',
        'spotify/artist/track' => 'spotify/track'
      }
    end

    def controller
      @args.controller.sub(
        'api/v1/', ''
      ).split('/').map(&:singularize).join('/')
    end

    def action
      @args.action
    end
  end
end
