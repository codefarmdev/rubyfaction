module Rubyfaction

  module File

    def replace_in_file(options = {})
      options.required(:filename)
      execute('replace_in_file', options)
    end

    def write_file(options = {})
      options.required(:filname, :str)
      default_options = {
        filename: nil,
        str: nil,
        mode: 'wb'
      }.deep_merge!(options)

      execute('write_file', default_options)
    end

  end

end