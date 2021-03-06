class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    	where("title ILIKE ?", "%#{search}%") 
    	
    
  	end
	
end
