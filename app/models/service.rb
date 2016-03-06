class Service < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  searchable do
    text :title, :boost => 5
    text :content
  end
end
