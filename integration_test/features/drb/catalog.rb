module Drb
  class Catalog
    @@url = "druby://localhost:5002"
    attr_reader :drb

    def initialize
      @drb = DRbObject.new_with_uri(@@url)
    end
  end
end
