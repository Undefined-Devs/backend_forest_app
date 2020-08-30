require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ForestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.load_defaults 5.1
    config.generators do |g|
      g.template_engine nil #to skip views
      g.test_framework  nil #to skip test framework
      g.assets  false
      g.stylesheets false
    end
    config.i18n.load_path += Dir[Rails.root.join('my','locales', '*{rb,yml}').to_s]
    config.i18n.default_locale = :es
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :delete]
      end
    end
  end
end
