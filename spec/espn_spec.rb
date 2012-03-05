# encoding: utf-8
require "spec_helper"

describe ESPN do

  it "should configure with api_key" do
    @client.api_key == "api_key"
  end

  it "should use HTTP API endpoint" do
    @client.api_url == "http://api.espn.com/v1"
  end

end
