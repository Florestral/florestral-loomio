class LotSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :size, :description, :created_at, :updated_at

  has_many :users, serializer: UserSerializer
end