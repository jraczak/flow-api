class Task < ApplicationRecord
  # TODO: Reinstate this relationship
  #belongs_to :user

  validates_presence_of :name, :original_scheduled_date, :current_scheduled_date
end
