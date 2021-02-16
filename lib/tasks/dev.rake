namespace :dev do
  desc 'Cadastra os Contatos'
  task setup: :environment do
    p 'Configuração Banco de Dados...'
    %x(rails db:drop db:create db:migrate)
    p 'Término configuração Banco de Dados'

    p 'Cadastrando Tipos de Contatos'
    kinds = %w(Amigos Comercial Diversos)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    p 'Tipos de Contatos cadastrados com sucesso'
    
    p 'Cadastrando os contatos....'
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    p 'Contatos cadastrados com sucesso'

    p 'Cadastrando os telefones...'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(
          number: Faker::PhoneNumber.cell_phone, 
          contact: contact
        )
        contact.phones << phone
        contact.save!
      end
    end
    p 'Telefones cadastrados com sucesso.'

    p 'Cadastrando endereços...'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        contact: contact
      )
    end
    p 'Endereços cadastrados com sucesso'
  end
end
