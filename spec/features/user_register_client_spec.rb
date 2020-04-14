require 'rails_helper'

feature 'User register client' do
    scenario 'successfully' do
       admin = User.create!(email: 'register@client.com', password: '333333', role: :admin)
        login_as(admin, scope: :user)

        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
        fill_in 'Email', with: 'register@client.com'
        fill_in 'Nome', with: 'Asta'
        fill_in 'CPF', with: '112.300.321-99'
        click_on 'Enviar'

        expect(page).to have_content('register@client.com')
        expect(page).to have_content('Asta')
        expect(page).to have_content('112.300.321-99')
    end
    scenario 'and must fill in all fields' do
        admin = User.create!(email: 'register@client.com', password: '333333', role: :admin)
        login_as(admin, scope: :user)

        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
        click_on 'Enviar'

        expect(page).to have_content('Email não pode ficar em branco')
        expect(page).to have_content('Nome não pode ficar em branco')
        expect(page).to have_content('CPF não pode ficar em branco')
    end
end