class Genre < ApplicationRecord

  has_many :items

  def self.looks(search, word)
    if search == "perfect_match"
      @genre = Genre.where("genre_name LIKE?", "#{word}")
    else
      @genre = Genre.all
    end
  end

end
