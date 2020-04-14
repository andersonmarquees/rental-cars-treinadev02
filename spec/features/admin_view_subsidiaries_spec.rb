require 'rails_helper'

feature 'Admin view subsidiaries' do
    scenario 'successfully' do
        Subsidiary.create(name: 'São Paulo', cnpj: '05.370.840/0001-07', address: 'Rua filial 1')

        admin = User.create!(email: 'view@view.com', password: '123456', role: :admin)

        login_as(admin, scope: :user)
        
        visit root_path
        click_on 'Filiais'
        click_on 'São Paulo'

        expect(page).to have_content('Filiais')
        expect(page).to have_content('São Paulo')
    end
    scenario 'and return to home page' do
        Subsidiary.create(name: 'São Paulo', cnpj: '05.370.840/0001-07', address: 'Rua filial 1')

        admin = User.create!(email: 'view2@view.com', password: '193456', role: :admin)

        login_as(admin, scope: :user)

        visit root_path
        click_on 'Filiais'
        click_on 'São Paulo'
        click_on 'Voltar'

        expect(current_path).to eq root_path
    end
end
