class Feed < ActiveRecord::Base
  extend FriendlyId
  friendly_id :topic, use: :slugged

  # searchable do
  #   text :topic
  # end
end
