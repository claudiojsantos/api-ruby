module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate
  
    belongs_to :kind do
      link(:related) { v1_contact_kind_url(object.id) }
    end
    has_one :address do
      link(:related) { v1_contact_address_url(object.id) }
    end
    has_many :phones do
      link(:related) { v1_contact_phones_url(object.id) }
    end
  
    # link(:self) { contact_url(object.id) }
  
    meta do
      {
        'author': 'Cláudio Santos'
      }
    end
  
    def attributes(*args)
      hash = super(*args)
      # hash[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
      hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
      hash
    end
  end
end
