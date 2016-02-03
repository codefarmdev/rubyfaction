module Rubyfaction

  module Cronjob

    def create_cronjob(options = {})
      options.required(:line)
      execute('create_cronjob', options)
    end

    def delete_cronjob(options = {})
      options.required(:line)
      execute('delete_cronjob', options)
    end

  end

end