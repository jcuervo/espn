require "espn/client"
require "espn/version"

directory = File.expand_path(File.dirname(__FILE__))

module ESPN

  class << self
    attr_accessor :api_key

    ##
    # Configure default credentials easily
    #
    # +api_key+

    def configure
      yield self
      true
    end

  end

end
