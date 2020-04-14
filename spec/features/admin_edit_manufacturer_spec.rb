require 'rails_helper'

feature 'Admin edit manufacturer' do
    scenario 'successfully' do
        Manufacturer.create(name: 'Fiat')

        admin = User.create!(email: 'testEdit@edit.com', password: '123456', role: :admin)

        login_as(admin, scope: :user)

        visit root_path
        click_on 'Fabricantes'
        click_on 'Fiat'
        click_on 'Editar'
        fill_in 'Nome', with: 'Honda'
        click_on 'Enviar'
        expect(page).to have_content('Honda')
    end
    scenario 'must fill in field' do
        Manufacturer.create(name: 'Ford')

        admin = User.create!(email: 'testfill@field.com', password: '123098', role: :admin)

        login_as(admin, scope: :user)

        visit root_path
        click_on 'Fabricantes'
        click_on 'Ford'
        click_on 'Editar'
        fill_in 'Nome', with: ''
        click_on 'Enviar'
        expect(page).to have_content('Os campos não podem ficar em branco.')
    end
end