require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'successfully' do
    admin = User.create!(email: 'test@test.com', password: '123456',
                         role: :admin)


    login_as(admin, scope: :user)
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Vila Mariana'
    fill_in 'CNPJ', with: '56.420.114/0001-45'
    fill_in 'Endereço', with: 'Rua Domingos de Morais, 1000'
    click_on 'Enviar'

    expect(page).to have_content 'Filial Vila Mariana'
    expect(page).to have_content 'CNPJ: 56.420.114/0001-45'
    expect(page).to have_content 'Endereço: Rua Domingos de Morais, 1000'
  end

  scenario 'and must fill in all fields' do
    admin = User.create!(email: 'test@test.com', password: '123456',
                         role: :admin)


    login_as(admin, scope: :user)
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    click_on 'Enviar'

    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
  end

  scenario 'and must be logged in' do
    visit new_subsidiary_path

    expect(current_path).to eq new_user_session_path
  end
end
