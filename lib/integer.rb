class Integer

  def to_array_of_bits(width)
    ("%0#{width}b" % self).split(//).map(&:to_i)
  end

end
