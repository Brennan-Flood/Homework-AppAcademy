class Stack
    def initialize
        @array = []
    end

    def push(el)
        array.push(el)
        el
    end

    def pop
        array.pop
    end
    
    def peek
        array.last  
    end
    private
    attr_reader :array
end

class Queue
    def initialize
        @array = []
    end

    def enqueue(el)
        array.push(el)
        el
    end

    def dequeue
        array.shift
    end

    def peek
        array.first 
    end

    private
    attr_reader :array

end