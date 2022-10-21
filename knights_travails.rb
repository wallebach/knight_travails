require_relative 'node.rb'

BOARD_MAX = 8

def valid?(x, y, board_max)
    return x >= 0 && x < board_max && y >= 0 && y < board_max
end

def has_node?(array, node)
    array.each do | element |
        return true if element.x == node.x && element.y == node.y 
    end
    return false
end

def knight_moves(start, dest, board_max)
    dx = [-2,-2,2,2,-1,-1,1,1]
    dy = [-1,1,-1,1,-2,2,-2,2]
    
    visited = []
    queue = []

    queue.push(start)

    while !queue.empty?
        node = queue.delete_at(0)

        x = node.x
        y = node.y
        dist = node.dist

        if (x == dest.x) && (y == dest.y) 
            return "knight moves( [#{start.x}, #{start.y}], [#{start.x}, #{start.y}]  ) == #{node.path.to_s}"
        end

        if !has_node?(visited, node)
            visited.push(node)

            for i in 0...board_max do 
                x_i = x + dx[i]
                y_i = y + dy[i]

                if valid?(x_i, y_i, board_max)
                    path = node.path.map(&:clone)
                    path.push([x_i, y_i])
                    queue.push(Node.new(x_i, y_i, dist + 1, path))
                end
            end
        end
    end
    return -1
end

start = Node.new(0,0)
dest = Node.new(1,2)

puts knight_moves(start, dest, BOARD_MAX)

