class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :age, :gender, :weight
  has_many :foods
end
