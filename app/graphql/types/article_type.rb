class Types::ArticleType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :body, String, null: false
end