class Faq < ActiveRecord::Base
  searchable do
    text :content
  end
end
