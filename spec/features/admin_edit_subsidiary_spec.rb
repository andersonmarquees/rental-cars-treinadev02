require 'rails_helper'

feature 'Admin edit subsidiary' do
    scenario 'successfully' do

        Subsidiary.create(
            name: 'Filial 1',
            cnpj: '05.370.840/0001-07',
            address: 'Rua Filial'
        )
        admin = User.create!(email: 'edit@subsidiary.com', password: '1233456', role: :admin)

        login_as(admin, scope: :user)

        visit root_path
        click_on 'Filiais'
        click_on 'Filial 1'
        click_on 'Editar'
        fill_in 'Nome', with: 'Filial 2'
        fill_in 'CNPJ', with: '01.000.950/0004-06'
        fill_in 'Endereço', with: 'AV. Filial'
        click_on 'Enviar'

        expect(page).to have_content('Filial 2')
        expect(page).to have_content('01.000.950/0004-06')
        expect(page).to have_content('AV. Filial')
    end
    scenario 'successfully' do

        Subsidiary.create(
            name: 'Filial 1',
            cnpj: '05.370.840/0001-07',
            address: 'Rua Filial'
        )

        admin = User.create!(email: 'edit2@subsidiary.com', password: '12334561', role: :admin)

        login_as(admin, scope: :user)

        visit root_path
        click_on 'Filiais'
        click_on 'Filial 1'
        click_on 'Editar'
        fill_in 'Nome', with: ''
        fill_in 'CNPJ', with: ''
        fill_in 'Endereço', with: ''
        click_on 'Enviar'

        expect(page).to have_content('Você deve informar todos os campos')
        
    end
end
