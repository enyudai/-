class Genre < ApplicationRecord

  has_many :items

  def self.looks(search, word)
    if search == "完全一致"
      @genre = Genre.where("genre_name LIKE?", "#{word}")
    else
      @genre = Genre.all
    end
  end

end
