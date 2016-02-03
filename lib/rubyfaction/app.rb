module Rubyfaction

  module App

    def create_app(options = {})

      options.required(:name, :type)

      default_options = {
        name: nil,
        type: nil,
        autostart: false,
        extra_info: '',
        open_port: false
      }.deep_merge!(options)

      execute('create_app', default_options)
    end

    def delete_app(options = {})

      options.required(:name)

      execute('delete_app', options)
    end

    def list_apps
      execute('list_apps')
    end

    def list_app_types
      execute('list_app_types')
    end

  end

end