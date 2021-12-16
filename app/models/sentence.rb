class Sentence < ApplicationRecord
  belongs_to :language
  belongs_to :origin
  belongs_to :author, class_name: "User" 
  belongs_to :schedule
end
