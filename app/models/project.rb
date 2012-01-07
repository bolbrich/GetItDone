class Project < ActiveRecord::Base

  validates :title, :kind, presence: true

  belongs_to :user
  has_many :to_dos, :dependent => :destroy
  
  validates :user_id, :presence => true
  
  def self.work
    where("kind = ?", "work")
  end
  
  def self.study
    where("kind = ?", "study")
  end
  
  def self.todos
    
  end
	
	
end
