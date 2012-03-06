# encoding: utf-8
require "spec_helper"

describe ESPN::Sports do

  it "should return mash list of news accross all sports/sections", :vcr do
    @client.sports(:all).equal? Hashie::Mash
  end

end
