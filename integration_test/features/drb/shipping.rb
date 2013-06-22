module Drb
  class Shipping
    @@url = "druby://localhost:5005"
    attr_reader :drb

    def initialize
      @drb = DRbObject.new_with_uri(@@url)
    end
  end
end
