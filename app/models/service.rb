class Service < ActiveRecord::Base

  searchable do
    text :title, :boost => 5
    text :content
  end
end
