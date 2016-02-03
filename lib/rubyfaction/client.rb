require 'yaml'
require 'erb'
require 'retryable'

require_relative 'app'
require_relative 'cronjob'
require_relative 'database'
require_relative 'dns'
require_relative 'domain'
require_relative 'email_address'
require_relative 'file'
require_relative 'general'
require_relative 'mailbox'
require_relative 'server'
require_relative 'shell_user'
require_relative 'website'
require_relative 'xml_rpc_retryable'

module Rubyfaction

  class Client

    attr_reader :connection
    attr_accessor :username, :password, :session_id, :host, :debug, :retry_timeouts,
                  :account, :machine

    def initialize(options = {})
      {
        host: "https://api.webfaction.com/",
        username: nil,
        password: nil,
        machine: ''
      }.merge(options).each{ |opt| self.send("#{opt[0]}=", opt[1]) }
      self
    end

    def connection
      if @connection.nil?
        @connection = XMLRPC::Client.new2(self.host)
        @connection.extend(XMLRPCRetryable) if retry_timeouts
      end

      @connection
    end

    def self.default
      self.new(host: "https://api.webfaction.com/", username: ENV['WEBFACTION_USERNAME'], password: ENV['WEBFACTION_PASSWORD'])
    end

    def execute(method, options = {})
      args = []

      if !self.session_id
        self.session_id, self.account = self.connection.call('login', self.username, self.password)
      end

      options_final = {
        session_id: self.session_id,
      }
      options_final.deep_merge!(options).each{|option| args.push(option[1]) if !option[1].nil?}

      if self.debug
        connection.set_debug
        server = self.connection.call(method, *args)
        pp server
      else
        self.connection.call(method, *args)
      end
    end

    include App
    include Cronjob
    include Database
    include DNS
    include Domain
    include EmailAddress
    include File
    include General
    include Mailbox
    include Server
    include ShellUser
    include Website

  end

end
