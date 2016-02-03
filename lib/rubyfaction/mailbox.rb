module Rubyfaction

  module Mailbox

    def change_mailbox_password(options = {})
      options.required(:mailbox, :password)
      execute('change_mailbox_password', options)
    end

    def create_mailbox(options = {})

      options.required(:mailbox)

      default_options = {
        mailbox: nil,
        enable_spam_protection: true,
        discard_spam: false,
        spam_redirect_folder: '',
        use_manual_procmailrc: false,
        manual_procmailrc: ''
      }.deep_merge!(options)

      execute('create_mailbox', default_options)
    end

    def delete_mailbox(options = {})
      options.required(:mailbox)
      execute('delete_mailbox', options)
    end

    def list_mailboxes
      execute('list_mailboxes')
    end

    def update_mailbox(options = {})

      options.required(:mailbox)

      default_options = {
        mailbox: nil,
        enable_spam_protection: true,
        discard_spam: false,
        spam_redirect_folder: '',
        use_manual_procmailrc: false,
        manual_procmailrc: ''
      }.deep_merge!(options)

      execute('update_mailbox', default_options)
    end

  end

end