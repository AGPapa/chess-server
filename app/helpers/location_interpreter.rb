module LocationInterpreter
  def to_internal_row(rank:)
    8 - rank.to_i
  end

  def to_internal_column(file:)
    ("a".."z").to_a.find_index(file.downcase)
  end

  def to_external_rank(row:)
    (8 - row).to_s
  end

  def to_external_file(column:)
    ("a".."z").to_a[column]
  end
end
