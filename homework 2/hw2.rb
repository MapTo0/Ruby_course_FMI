class NumberSet
  include Enumerable

  def initialize *set
    @set = set
  end

  def each &block
    @set.each(block)
  end

  def <<(digit)
    if (@set.include? digit)
      return
    else
    @set.push(digit)
    end
    NumberSet.new(@set)
  end

  def size
    @set.size
  end

  def empty?
    @set.empty?
  end

  def [](filters)
    if filters.class == Array
      case filters[2]
      when '&' then filtering [filters[0], filters[1]], '&'
      when '|' then filtering [filters[0], filters[1]], '|'
      end
    else
        filters.filter_array(@set)
    end
  end

  def filtering filters, sign
    temp_arrays = []
    filters.each do |filter|
        temp_arrays.push(filter.filter_array(@set))
    end
    case sign
    when '&' then temp_arrays[0] & temp_arrays[1]
    when '|' then temp_arrays[0] | temp_arrays[1]
    end
  end
end

class Filter
  def initialize &block
    @final_block = block
  end

  def &(second)
    filter_types = [self, second, '&']
  end

  def |(second)
    filter_types = [self, second, '|']
  end

  def filter_array numbers_array
    result = []
    numbers_array.each do |item|
      if(@final_block.call(item) == true)
        result.push(item)
      end
    end
     result
  end
end

class SignFilter < Filter
  def initialize sign
    @sign = sign
  end

  def filter_array numbers_array
    case @sign
    when :positive then numbers_array.delete_if { |n| n <= 0 }
    when :negative then numbers_array.delete_if { |n| n >= 0 }
    when :non_positive then numbers_array.delete_if { |n| n > 0 }
    when :non_negative then numbers_array.delete_if { |n| n < 0 }
    end
  end
end

class TypeFilter < Filter
  def initialize type
    @type = type
  end

  def filter_array numbers_array
    case @type
    when :integer
      filter_type_array numbers_array, Fixnum
    when :complex
      filter_type_array numbers_array, Complex
    else
      float_arr = filter_type_array numbers_array, Float
      rat_arr = filter_type_array numbers_array, Rational
      float_arr + rat_arr
    end
  end

  def filter_type_array array, filter_type
    filtered_array = []
    array.each do |item|
      if(item.class == filter_type)
        filtered_array.push(item)
      end
    end
     filtered_array
  end
end