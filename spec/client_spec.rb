require_relative 'spec_helper'

describe "#client" do

  it '#initialize' do
    expect(CLIENT.class).to eq(Rubyfaction::Client)
  end

  it "#execute" do
    allow_any_instance_of(Rubyfaction::Client).to receive_message_chain(:connection, :call).and_return( "teste" )
    expect(CLIENT.execute("test", {})).to eq( "teste" )
  end

  it '#execute only sets up retries for the current instance' do
    retryable_connection = Rubyfaction::Client.new(CLIENT_OPTS.merge(retry_timeouts: true)).connection
    standard_connection = Rubyfaction::Client.new(CLIENT_OPTS).connection

    expect(retryable_connection).to respond_to(:call_with_retry)
    expect(standard_connection).to_not respond_to(:call_with_retry)
  end

  it '#execute retries timeouts when retry_timeouts option is true' do
    client = Rubyfaction::Client.new(CLIENT_OPTS.merge(retry_timeouts: true))
    connection = client.connection
    expect(client).to receive(:connection).and_return(connection)

    expect(connection).to receive(:call_without_retry).twice.and_raise(Timeout::Error)
    expect { client.execute('create_mailbox', {}) }.to raise_error(Timeout::Error)
  end

  it '#execute retries when catch broken pipe exception and retry_timeouts option is true' do
    client = Rubyfaction::Client.new(CLIENT_OPTS.merge(retry_timeouts: true))
    connection = client.connection
    expect(client).to receive(:connection).and_return(connection)

    expect(connection).to receive(:call_without_retry).twice.and_raise(Errno::EPIPE)
    expect { client.execute('create_mailbox', {}) }.to raise_error(Errno::EPIPE)
  end

  it '#execute does not retry timeouts by default' do
    client = Rubyfaction::Client.new(CLIENT_OPTS)
    expect(client).to_not receive(:call_with_retry)
  end

  it "#connection does not include cookies" do
    client = Rubyfaction::Client.new(CLIENT_OPTS)
    connection = client.connection
    expect(connection.cookie).to eq nil
  end
end
