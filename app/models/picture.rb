class Picture < ActiveRecord::Base

  belongs_to :item

  validates :image, attachment_presence: true
  validates :item_id, presence: true

  #validates_attachment :image, :presence => true,
  #:content_type => { :content_type => "image/jpg" },
  #:size => { :in => 0..100.kilobytes }

  #Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.9.0-Q16'

  has_attached_file :image, styles: {
      thumbnail: "80x80",
      med: "300x300",
      large: "500x500"
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
