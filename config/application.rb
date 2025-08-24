require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ScheduleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # ─── ここが追加分（クラスの“中”） ───
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # ─────────────────────────────────────
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
