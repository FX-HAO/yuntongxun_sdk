require 'spec_helper'

RSpec.describe YuntongxunSdk do
  let(:config) do
    YuntongxunSdk.configure do |cfg|
      cfg.account_sid = "123456"
      cfg.auth_token = "foobar"
      cfg.app_id = "1"
      cfg.gateway = "https://app.cloopen.com"
    end
    YuntongxunSdk.config
  end

  it 'test configure' do
    expect(config.account_sid).to eq("123456")
    expect(config.auth_token).to eq("foobar")
    expect(config.app_id).to eq("1")
    expect(config.gateway).to eq("https://app.cloopen.com")
  end
end
