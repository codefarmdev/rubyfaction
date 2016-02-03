module Rubyfaction

  module General

    def list_disk_usage
      execute('list_disk_usage')
    end

    def list_bandwidth_usage
      execute('list_bandwidth_usage')
    end

    def run_php_script(options = {})
      options.required(:script, :code_before)
      execute('run_php_script', options)
    end

    def set_apache_acl(options = {})
      options.required(:paths)
      default_options = {
        paths: nil,
        permission: 'rwx',
        recursive: false
      }.deep_merge!(options)

      execute('set_apache_acl', default_options)
    end

    def system(options = {})
      options.required(:cmd)
      execute('system', options)
    end

  end

end