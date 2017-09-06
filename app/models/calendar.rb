class Calendar < ApplicationRecord

  def previous
  end

  def next
    @tmp += 42
    @ed_end += 42
  end
end
