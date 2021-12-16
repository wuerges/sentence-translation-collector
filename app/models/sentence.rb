class Sentence < ApplicationRecord
  belongs_to :language
  belongs_to :origin, class_name: "Sentence"
  # belongs_to :origin, inverse_of: :descendants, class_name: "Sentence", foreign_key: :sentence_id
  has_many :descendants, inverse_of: :origin, class_name: "Sentence", foreign_key: "origin_id"
  belongs_to :author
end
