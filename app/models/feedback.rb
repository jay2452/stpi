class Feedback < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :description, presence: true

  # searchable do
  #   text :title, :boost => 5
  #   text :content
  # end
end
