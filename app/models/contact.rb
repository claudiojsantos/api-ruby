class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  def to_br
    {
      name: name,
      email: email,
      birthdate: (I18n.l(birthdate) unless birthdate.blank?)
    }
  end

  # def author
  #   'Claudio Santos'
  # end

  # def kind_description
  #   kind.description
  # end

  # def as_json(_options = {})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author],
  #     include: { kind: { only: :description } }
  #   )
  # end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.default_locale
  # end
end
