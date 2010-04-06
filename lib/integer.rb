class Integer

  def to_array_of_bits(width)
    ("%0#{width}b" % self).split(//).map(&:to_i)
  end

  def negate
    self + 1 & 1
  end

end
