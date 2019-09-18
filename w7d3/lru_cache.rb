class LRUCache
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @cache.size
  end

  def add(el)
    # adds element to cache according to LRU principle
    if prevent_dup(el)
      @cache << el
    else
      prevent_overflow
      @cache << el
    end 

  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache 
  end

  private
    # helper methods go here!
    def prevent_dup(el)
      if @cache.include?(el)
        @cache.delete(el)
        return true
      end
      false
    end

    def prevent_overflow
      if @size <= count
        @cache.shift 
      end
    end

end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.show
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.show
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show