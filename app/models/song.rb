class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validate :release_year_check
  validates :release_year, presence: true, if: :released?

  def released?
    self.released
  end

  def release_year_check
    if self.release_year
      if self.release_year > Time.now.year
      errors.add(:release_year, "Future Dated")
    end
  end
end


end
