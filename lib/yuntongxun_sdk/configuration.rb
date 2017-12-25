# Global configuration for YuntongxunSdk.
class YuntongxunSdk::Configuration
  # The gateway to use for API requests
  attr_accessor :gateway

  # The default Account ID and token to be used
  attr_accessor :account_sid, :auth_token

  # The default App ID
  attr_accessor :app_id

  # Default server information for Yuntongxun. These can be overridden by setting config values.
  # See YuntongxunSdk.config.
  DEFAULT_SERVERS = {
    gateway: 'https://app.cloopen.com:8883',
  }.freeze

  def initialize
    # Default to our default values.
    DEFAULT_SERVERS.each_pair do |key, value|
      self.public_send("#{key}=", value)
    end
  end
end
