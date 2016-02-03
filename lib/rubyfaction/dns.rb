module Rubyfaction

  module DNS

    def create_dns_override(options = {})
      options.required(:domain)
      default_options = {
        domain: nil,
        a_ip: '',
        cname: '',
        mx_name: '',
        mx_priority: '',
        spf_record: '',
        aaaa_ip: '',
        srv_record: ''
      }.deep_merge!(options)

      execute('create_dns_override', default_options)
    end

    def delete_dns_override(options = {})
      options.required(:domain)
      execute('delete_dns_override', options)
    end

    def list_dns_overrides
      execute('list_dns_overrides')
    end

  end

end