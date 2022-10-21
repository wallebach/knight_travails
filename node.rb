class Node
    attr_accessor :x
    attr_accessor :y
    attr_accessor :dist

    def initialize(x, y, dist = 0)
        @x = x
        @y = y
        @dist = dist
    end
end