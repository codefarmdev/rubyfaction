module Rubyfaction

  module Website

    def create_website(options = {})
      options.required(:website_name, :ip, :https, :subdomains, :site_apps)
      execute('create_website', options)
    end

    def delete_website(options = {})
      options.required(:website_name, :ip)
      default_options = {
        website_name: nil,
        ip: nil,
        https: false
      }.deep_merge!(options)

      execute('delete_website', default_options)
    end

    def list_websites
      execute('list_websites')
    end

  end

end