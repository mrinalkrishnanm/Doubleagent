class Code < ActiveRecord::Base
    scope :keyword, -> (name) { where("name like ?", "%#{name}%")}
    scope :language, -> (language) { where(language: language) }
    scope :category, -> (category) { where(category: category) }
    scope :difficulty, -> (difficulty) { where(difficulty: difficulty) }
end
