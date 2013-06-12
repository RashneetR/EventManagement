class Rule < ActiveRecord::Base
  attr_accessible :description, :event_id

  belongs_to :event

  validates :description, :presence => true, :uniqueness => true
end
