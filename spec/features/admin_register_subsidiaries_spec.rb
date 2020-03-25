require 'rails_helper'

feature 'Admin register Subsidiaries' do
    scenario 'successfully' do
        subsidiary = Subsidiary.new(
            name: 'Sao Paulo',
            cnpj: '05.370.840/0001-07',
            address: 'Rua da filial 1'
        )
        visit root_path
        click_on 'Filiais'
        click_on 'Registrar nova Filial'

        fill_in 'Nome', with: 'Sao Paulo'
        fill_in 'CNPJ', with: '05.370.840/0001-07'
        fill_in 'Endereço', with: 'Rua da filial 1'
        click_on 'Enviar'
    end

    scenario 'and must fill in fields' do
        subsidiary = Subsidiary.new(
            name: 'Sao Paulo',
            cnpj: '05.370.840/0001-07',
            address: 'Rua da filial 1'
        )
        visit new_subsidiary_path
        fill_in 'Nome', with: ''
        fill_in 'CNPJ', with: ''
        fill_in 'Endereço', with: ''
        click_on 'Enviar'

        expect(page). to have_content('Você deve informar todos os campos')

    end
    xscenario 'and nome e cnpj must be unique' do
        subsidiary = Subsidiary.new(
            name: 'Sao Paulo',
            cnpj: '05.370.840/0001-07',
            address: 'Rua da filial 1'
        )
        visit new_subsidiary_path
        fill_in 'Nome', with: 'Sao Paulo'
        fill_in 'CNPJ', with: '05.370.840/0001-07'
        fill_in 'Endereço', with: 'Rua da filial 1'
        click_on 'Enviar'

        expect(page).to have_content('Nome ou CNPJ já está em uso')
    end
end