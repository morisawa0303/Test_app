class Post < ApplicationRecord
    mount_uploader :image_path, ImageUploader
    belongs_to :user

    validates :content,{presence: true, length: {maximum:140}}
end
