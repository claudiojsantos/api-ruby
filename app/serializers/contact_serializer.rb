class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { contact_url(object.kind.id) }
  end
  has_one :address
  has_many :phones

  # link(:self) { contact_url(object.id) }

  meta do
    {
      "author": "Cláudio Santos"
    }
  end

  def attributes(*args)
    hash = super(*args)
    # hash[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end
end
