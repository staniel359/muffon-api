require 'playwright'

module AmazonMusic
  module Utils
    module Track
      module Audio
        class Cookies < AmazonMusic::Base
          BASE_URL =
            'https://www.amazon.co.uk/ap/signin?openid.return_to=https%3A%2F%2Fwww.amazon.co.uk%2Fref%3Dnav_ya_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=gbflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0'.freeze
          PLAYWRIGHT_EXECUTABLE_PATH =
            './node_modules/.bin/playwright-core'.freeze
          COOKIES_NAMES = %w[
            ubid-acbuk
            at-acbuk
          ].freeze

          def call
            data
          end

          private

          def data
            cookies_data_formatted.slice(
              *COOKIES_NAMES
            )
          end

          def cookies_data_formatted
            cookies_data.map.to_h do |cookie_data|
              cookie_data.values_at(
                'name',
                'value'
              )
            end
          end

          def cookies_data
            ::Playwright.create(
              playwright_cli_executable_path:
                PLAYWRIGHT_EXECUTABLE_PATH
            ) do |playwright|
              authenticate_and_get_cookies(
                playwright
              )
            end
          end

          def authenticate_and_get_cookies(
            playwright
          )
            playwright
              .chromium
              .launch(
                headless: true
              ) do |browser|
                context = browser.new_context

                page = context.new_page

                page.goto(
                  BASE_URL
                )

                page.fill(
                  '#ap_email_login',
                  email
                )

                page.click(
                  '#continue input[type="submit"]'
                )

                page.fill(
                  '#ap_password',
                  password
                )

                page.click(
                  '#signInSubmit'
                )

                context.cookies
              end
          end

          def email
            credentials.dig(
              :amazon_music,
              :credentials,
              :email
            )
          end

          def password
            credentials.dig(
              :amazon_music,
              :credentials,
              :password
            )
          end
        end
      end
    end
  end
end
