require 'rails_helper'

feature 'Admin view subsidiaries' do
    scenario 'successfully' do
        subsidiary = Subsidiary.create!(name: 'São Paulo', cnpj: '05.370.840/0001-07', 
                                        address: 'Rua filial 1')
        
        visit root_path
        click_on 'Filiais'
        click_on 'São Paulo'

        expect(page).to have_content('Filiais')
        expect(page).to have_content('São Paulo')
    end
    scenario 'and return to home page' do
        subsidiary = Subsidiary.create!(name: 'São Paulo', cnpj: '05.370.840/0001-07', 
                                        address: 'Rua filial 1')

        visit root_path
        click_on 'Filiais'
        click_on 'São Paulo'
        click_on 'Voltar'

        expect(current_path).to eq root_path
    end
end
