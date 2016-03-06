class Download < ActiveRecord::Base

	extend FriendlyId
  friendly_id :title, use: :slugged

	searchable do
    text :title, :boost => 5
    text :file_file_name
  end

	has_attached_file :file
	validates_attachment :file
	validates_attachment_content_type :file, content_type: %w(image/jpeg image/jpg image/png file/pdf)
end
