class Download < ActiveRecord::Base


	has_attached_file :file
	validates_attachment :file
	validates_attachment_content_type :file, content_type: %w(image/jpeg image/jpg image/png file/pdf)
end
