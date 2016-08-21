class Code < ActiveRecord::Base
    scope :keyword, -> (name) { where("LOWER(name) like ?", "%#{name.downcase}%")}
    scope :language, -> (language) { where(language: language.downcase) }
    scope :category, -> (category) { where(category: category.downcase) }
    scope :difficulty, -> (difficulty) { where(difficulty: difficulty.downcase) }
end
