class Karatsuba
  attr_accessor :odd_count

  def multiple(first, second)
    @first = first.to_i
    @second = second.to_i
    return (first.to_i * second.to_i).to_s if first.to_i < 10 && second.to_i < 10
    @odd_count = 0
    first_str = first.to_s
    second_str = second.to_s
    first_str = odd_to_even(first_str)
    second_str = odd_to_even(second_str)
    first_str, second_str = align(first_str, second_str)
    a = first_str[0, first_str.length/2]
    b = first_str[first_str.length/2, first_str.length/2]
    c = second_str[0, second_str.length/2]
    d = second_str[second_str.length/2, second_str.length/2]
    karatsuba = Karatsuba.new
    step1 = karatsuba.multiple(a, c)
    step2 = karatsuba.multiple(b, d)
    step3 = karatsuba.multiple((a.to_i + b.to_i), (c.to_i + d.to_i))
    step4 = step3.to_i - step2.to_i - step1.to_i
    step5 = step1.to_i*10**first_str.length + step4.to_i*10**(first_str.length/2) + step2.to_i
    step5 = remove_odds(step5)
  end

  def remove_odds(value)
    value.to_s[0, value.to_s.length - @odd_count]
  end

  def align(first, second)
    diff = (first.length - second.length).abs
    return [first, second] if diff == 0
    if first.length > second.length 
      second = fill(second, diff)
    else
      first = fill(first, diff)
    end
    return [first, second]
  end

  def fill(value, count)
    @odd_count += count
    value = value + "0"*count
  end

  def odd_to_even(value)
    if (value.length % 2) > 0
      value = value + "0"
      @odd_count += 1
    end
    value
  end
end
