class Sentence < ApplicationRecord
  belongs_to :language
  belongs_to :origin
  belongs_to :author
  belongs_to :schedule
end
