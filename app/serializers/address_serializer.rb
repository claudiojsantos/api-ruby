module V1
  class AddressSerializer < ActiveModel::Serializer
    attributes :id, :street, :city
  end
end
