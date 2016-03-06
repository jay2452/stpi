class Policy < ActiveRecord::Base
  searchable do
    text :content
  end
end
