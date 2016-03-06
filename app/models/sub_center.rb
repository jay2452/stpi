class SubCenter < ActiveRecord::Base
  searchable do
    text :content
  end
end
