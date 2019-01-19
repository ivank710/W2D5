require "byebug"
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0

    self.each.with_index do |el, idx|
      sum = el.hash * idx.hash
      result += sum.hash
      # result += el.hash
      # result += idx.hash
    end

    result.hash
  end
end

class String
  def hash
    # debugger
    result = []

    self.chars.each.with_index do |ch, idx|
      result << (ch.ord * idx).hash
    end
    # debugger
    result.hash
    #self.chars.map(&:to_i).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0

    self.each do |k, val|
      result += k.hash*val.hash
    end

    result
  end
end
