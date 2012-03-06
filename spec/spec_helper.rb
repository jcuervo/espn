require "espn"
require "vcr"
require "simplecov"
require "simplecov-rcov"

class SimpleCov::Formatter::MergedFormatter
  def format result
    SimpleCov::Formatter::HTMLFormatter.new.format result
    SimpleCov::Formatter::RcovFormatter.new.format result
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
SimpleCov.start do
  add_filter '/vendor'
end

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
  c.filter_sensitive_data('APIKEY') do |interaction|
    interaction.request.uri = '?apikey='
  end
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.before(:each) do
    ESPN.configure do |config|
      config.api_key = "YOUR API KEY HERE"
    end

    @client = ESPN::Client.new
  end
end
