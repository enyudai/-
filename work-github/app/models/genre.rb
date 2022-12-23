class Genre < ApplicationRecord

  has_many :items

  def self.looks(search, word)
    if search == "perfect_match"
      @jenre = Jenre.where("genre_name LIKE?", "#{word}")
    else
      @jenre = Jenre.all
    end
  end

end
