class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    def content_to_string
        JSON.parse(content).join("\n")
    end 
end
