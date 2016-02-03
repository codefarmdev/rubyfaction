module Rubyfaction

  module Database


    def create_db(options = {})
      options.required(:name, :db_type, :password)
      execute('create_db', options)
    end

    def delete_db(options = {})
      options.required(:name, :db_type)
      execute('delete_db', options)
    end

    def create_db_user(options = {})
      options.required(:username, :password, :db_type)
      execute('create_db_user', options)
    end

    def delete_db_user(options = {})
      options.required(:username, :db_type)
      execute('delete_db_user', options)
    end

    def change_db_user_password(options = {})
      options.required(:username, :password, :db_type)
      execute('change_db_user_password', options)
    end

    def grant_db_permissions(options = {})
      options.required(:username, :database, :db_type)
      execute('grant_db_permissions', options)
    end

    def revoke_db_permissions(options = {})
      options.required(:username, :database, :db_type)
      execute('revoke_db_permissions', options)
    end

    def make_user_owner_of_db(options = {})
      options.required(:username, :database, :db_type)
      execute('make_user_owner_of_db', options)
    end

    def enable_addon(options = {})
      options.required(:database)
      default_options = {
        database: nil,
        db_type: 'postgresql'
      }.deep_merge!(options)

      execute('enable_addon', default_options)
    end

    def list_dbs
      execute('list_dbs')
    end

    def list_db_users
      execute('list_db_users')
    end


  end

end