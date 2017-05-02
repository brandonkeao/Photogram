class Post < ApplicationRecord
	validates :image, presense: true
	has_attached_file :image, styles: { :medium => "640" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
