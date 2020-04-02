require 'rails_helper'

feature 'Admin edit manufacturer' do
    scenario 'successfully' do
        Manufacturer.create(name: 'Fiat')

        visit root_path
        click_on 'Fabricantes'
        click_on 'Fiat'
        click_on 'Editar'
        fill_in 'Nome', with: 'Honda'
        click_on 'Enviar'
        expect(page).to have_content('Honda')
    end
    scenario '' do
        Manufacturer.create(name: 'Ford')

        visit root_path
        click_on 'Fabricantes'
        click_on 'Ford'
        click_on 'Editar'
        fill_in 'Nome', with: ''
        click_on 'Enviar'
        expect(page).to have_content('Os campos não podem ficar em branco.')
    end
end