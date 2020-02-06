class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :calories, :fat, :carbs, :protein
end
