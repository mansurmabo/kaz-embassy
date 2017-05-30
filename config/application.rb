require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module KazEmbKg
  class Application < Rails::Application
     config.i18n.default_locale = :kz
     config.i18n.available_locales = [:ru, :en, :kz]
     config.time_zone = 'Astana'
     config.active_record.raise_in_transactional_callbacks = true
  end
end
