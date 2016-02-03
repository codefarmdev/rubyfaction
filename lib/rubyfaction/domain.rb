module Rubyfaction

  module Domain

    def create_domain(options = {})
      options.required(:domain)
      execute('create_domain', options)
    end

    def delete_domain(options = {})
      options.required(:domain)
      execute('delete_domain', options)
    end

    def list_domains
      execute('list_domains')
    end

  end

end