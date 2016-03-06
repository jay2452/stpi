class Tender < ActiveRecord::Base
  searchable do
    text :content
  end
end
