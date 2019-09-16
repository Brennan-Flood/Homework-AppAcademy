
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  largest_fish = nil
  fish.each do |fish1|
    if largest_fish == nil
      largest_fish = fish1
    end
    fish.each do |fish2|
      if fish2.length > fish1.length
        largest_fish = fish2
      end
    end
  end
largest_fish
end

class Array

  def merge_sort(&prc)
    return self if self.length < 2
    prc ||= Proc.new{|el1, el2| el1.length <=> el2.length}
    mid = self.length / 2

    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        sorted << left.shift  
      when 0 
        sorted << left.shift
      when 1
        sorted << right.shift
      end
    end
    sorted + left + right
  end
end

def clever_octopus(fishes)
  fishes.inject {|acc, el| acc.length >= el.length ? acc : el}
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(array, target)
  array.each_with_index do |tile, i|
    return i if tile == target
  end
end
tiles_hash = {
  up:0,
  right_up:1,
  right:2,
  right_down:3,
  down:4,
  left_down:5,
  left:6,
  left_down:7,
  left_up:8
}
def fast_dance(hash, target)
hash[target]
end
p sluggish_octopus(fish)
p fish.merge_sort[-1]
p clever_octopus(fish)
p slow_dance(tiles_array, "up")
p slow_dance(tiles_array, "right-down")
p fast_dance(tiles_hash, :up)
p fast_dance(tiles_hash, :right_down)

