module YuntongxunSdk
  class API
    def initialize(account_sid = YuntongxunSdk.config.account_sid, auth_token = YuntongxunSdk.config.auth_token, app_id = YuntongxunSdk.config.app_id)
      @account_sid = account_sid
      @auth_token = auth_token
      @app_id = app_id
    end

    class RequestFailureError < StandardError
      attr_reader :response, :status_code

      def initialize(response, status_code)
        @response = response
        @status_code = status_code
      end

      def message
        @response.to_json
      end

      def to_s
        message
      end
    end

    # Makes a request to the appropriate YuntongxunSdk API.
    # @note You'll rarely need to call this method directly.
    #
    # @param path the server path for this request (leading / is prepended if not present)
    # @param args arguments to be sent to YuntongxunSdk
    # @param verb the HTTP method to use
    # @param options request-related options
    def api(path, args = {}, verb = "post", options = {})
      args = {
        appId: @app_id
      }.merge(args)

      batch = DateTime.now.strftime("%Y%m%d%H%M%S")
      signature = "#{@account_sid}#{@auth_token}#{batch}"
      sig = Digest::MD5.hexdigest(signature).upcase

      gateway = options.delete(:gateway) || YuntongxunSdk.config.gateway
      # add a leading / if needed...
      path = "/#{path}" unless path =~ /^\//
      url = "#{gateway}/2013-12-26/Accounts/#{@account_sid}#{path}?sig=#{sig}"

      headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json;charset=utf-8",
        "Authorization" => Base64.strict_encode64("#{@account_sid}:#{batch}")
      }

      response = YuntongxunSdk.make_request(url, verb, args, headers)
      build_reponse(response)
    end

    private

    def build_reponse(response)
      body = JSON.parse(response.body)
      raise RequestFailureError.new(body, body["statusCode"]) if body["statusCode"] != "000000"
      body
    end
  end
end
