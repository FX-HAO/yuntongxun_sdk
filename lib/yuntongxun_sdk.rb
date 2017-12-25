require "json"
require "date"
require "digest"
require "base64"
require "rest-client"

require "yuntongxun_sdk/version"
require "yuntongxun_sdk/configuration"
require "yuntongxun_sdk/api"

module YuntongxunSdk
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end

  def self.make_request(url, method, payload = {}, headers = {})
    RestClient::Request.execute(method: method, url: url, payload: payload.to_json, headers: headers)
  end
end
