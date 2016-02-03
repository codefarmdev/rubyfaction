module Rubyfaction

  module EmailAddress

    def create_email(options = {})

      options.required(:email_address, :targets)

      default_options = {
        email_address: nil,
        targets: nil,
        autoresponder_on: false,
        autoresponder_subject: '',
        autoresponder_message: '',
        autoresponder_from: '',
        script_machine: '',
        script_path: ''
      }.deep_merge!(options)

      execute('create_email', default_options)
    end

    def delete_email(options = {})
      options.required(:email_address)
      execute('delete_email', options)
    end

    def list_emails
      execute('list_emails')
    end

    def update_email(options = {})

      options.required(:email_address, :targets)

      default_options = {
        email_address: nil,
        targets: nil,
        autoresponder_on: false,
        autoresponder_subject: '',
        autoresponder_message: '',
        autoresponder_from: '',
        script_machine: '',
        script_path: ''
      }.deep_merge!(options)

      execute('update_email', default_options)
    end

  end

end