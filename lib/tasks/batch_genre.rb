class Tasks::BatchGenre
    def self.execute
        
        genre_list = ["rpg","action","shooting","simulation","adventure","sports","music","table","fighting","other"]
        
        
        genre_list.each do |genre|
            Genre.create(genre: genre)
        end
    end
end

