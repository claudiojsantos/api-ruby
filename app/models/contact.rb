class Contact < ApplicationRecord
  belongs_to :kind, optional: true

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

  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end
end
