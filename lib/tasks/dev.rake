namespace :dev do
  desc 'Cadastra os Contatos'
  task setup: :environment do
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
  end
end
