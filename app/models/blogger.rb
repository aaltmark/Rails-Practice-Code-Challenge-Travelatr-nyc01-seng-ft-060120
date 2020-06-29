class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: {only_integer: true, greater_than: 0}
    validates :bio, length: {minimum: 30}
    
    def total_likes
      self.posts.sum { |p| p.likes}
    end

    def most_liked_post
        self.posts.max_by{|p| p.likes}
    end
    
end
