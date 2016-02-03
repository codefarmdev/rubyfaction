module Rubyfaction

  module Server

    def list_ips
      execute('list_ips')
    end

    def list_machines
      execute('list_machines')
    end

  end

end