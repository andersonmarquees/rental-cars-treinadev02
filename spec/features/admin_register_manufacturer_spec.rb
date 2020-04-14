require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'successfully' do

    admin = User.create!(email: 'test@register.com', password: '123456', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Fiat')
  end
  scenario 'must fill in field' do
    Manufacturer.create(name: 'Ford')

    admin = User.create!(email: 'testfield@fill.com', password: '765432', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Fabricantes'
    click_on 'Ford'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'
    expect(page).to have_content('Os campos não podem ficar em branco.')
  end
  scenario 'and nome must be unique' do
    Manufacturer.create(name: 'Fiat')

    admin = User.create!(email: 'testunique@field.com', password: '1234568', role: :admin)

    login_as(admin, scope: :user)

    visit new_manufacturer_path

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end
end