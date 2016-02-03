module Rubyfaction

  module ShellUser

    def change_user_password(options = {})
      options.required(:username, :password)
      execute('change_user_password', options)
    end

    def create_user(options = {})
      options.required(:username, :shell, :groups)
      execute('create_user', options)
    end

    def delete_user(options = {})
      options.required(:username)
      execute('delete_user', options)
    end

    def list_users
      execute('list_users')
    end

  end

end