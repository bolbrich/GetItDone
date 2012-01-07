class ToDo < ActiveRecord::Base

  validates :title, :deadline, presence: true
  
  belongs_to :project
  
  default_scope :order => 'to_dos.deadline ASC'

  def self.outstanding
    where("done = ?", false)
  end
  
  def self.done
    where("done = ?", true)
  end
  
end
