module Drb
  class Purchasing
    @@url = "druby://localhost:5004"
    attr_reader :drb

    def initialize
      @drb = DRbObject.new_with_uri(@@url)
    end
  end
end
