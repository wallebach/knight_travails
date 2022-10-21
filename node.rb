class Node
    attr_accessor :x
    attr_accessor :y
    attr_accessor :dist
    attr_accessor :path

    def initialize(x, y, dist = 0, path = [[x,y]])
        @x = x
        @y = y
        @dist = dist
        @path = path
    end
end