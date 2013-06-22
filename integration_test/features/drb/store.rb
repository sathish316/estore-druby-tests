module Drb
  class Store
    @@url = "druby://localhost:5001"
    attr_reader :drb

    def initialize
      @drb = DRbObject.new_with_uri(@@url)
    end
  end
end
