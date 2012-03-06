module ESPN
  module Sports

    ##
    # Get News for specified sport
    #
    # +:type+ [:basketball, :boxing, :football, :golf, :hockey, :horse_racing, :mma, :racing, :soccer, :tennis]
    # +options={}+

    def sports(type, options={})
      #path = "/v1/#{type.to_s}"
      path = "/v1/sports"

      case type
      when :all
        path
      else
        path += "/#{type.to_s}"
      end

      get(path, options)
    end

  end
end
