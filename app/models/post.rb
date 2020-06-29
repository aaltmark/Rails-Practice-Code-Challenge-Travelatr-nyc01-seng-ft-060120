class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true
    validates :content, length: {minimum: 100}
    before_create :zero_likes
    
    
    

    def content_to_string
      begin
        JSON.parse(content).join("\n")
      rescue
        content
      end
    end

    def zero_likes
      self.likes = 0
    end
    
   
    def add_like
      self.likes += 1
      self.save
    end
end
