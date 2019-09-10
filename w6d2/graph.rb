class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        self.val = val
        self.neighbors = []
    end

   
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
 
def bfs(starting_node, target_value)
    visited = []
    queue = [starting_node]
    until queue.empty?
        return queue.first if queue.first.val == target_value
        queue.first.neighbors.each do |neighbor|
            queue << neighbor if !visited.include?(neighbor)
        end
        visited << queue.shift 

    end

end
p bfs(a, 'b')
p bfs(a,'f')

