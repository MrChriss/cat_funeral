class Funeral < ApplicationRecord
  validates :name, presence: true, length: { maximum: 140 }
  before_save :set_end_time

  def set_end_time
    self.end_time = self.start_time + 2.hours
  end    
end
