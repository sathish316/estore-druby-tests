module Drb
  class Warehouse
    @@url = "druby://localhost:5003"
    attr_reader :drb

    def initialize
      @drb = DRbObject.new_with_uri(@@url)
    end
  end
end
