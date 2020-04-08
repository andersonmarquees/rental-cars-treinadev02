require 'rails_helper'

feature 'Admin reister car categories' do
    scenario 'successfully' do
        CarCategory.new(name: 'A', daily_rate: 99, car_insurance: 1000, 
            third_party_insurance: 1499)
        
        visit root_path
        click_on 'Categorias de Carros'
        click_on 'Registrar nova Categoria'
        fill_in "Nome", with: 'A'
        fill_in "Diária Padrão", with: 99
        fill_in "Seguro do Carro", with: 1000
        fill_in "Seguro para Terceiros", with: 1499
        click_on "Enviar"
        expect(page).to have_content('A')
        expect(page).to have_content(99)
        expect(page).to have_content(1000)
        expect(page).to have_content(1499)
    end
    scenario 'Must fill in fields' do
        CarCategory.new(name: 'A', daily_rate: 99, car_insurance: 1000, 
            third_party_insurance: 1499)
        
        visit new_car_category_path
        
        fill_in "Nome", with: ''
        fill_in "Diária Padrão", with: ''
        fill_in "Seguro do Carro", with: ''
        fill_in "Seguro para Terceiros", with: ''
        click_on "Enviar"
        expect(page).to have_content('Você deve informar todos os campos')
    end
    scenario 'unique' do
        CarCategory.create(name: 'A', daily_rate: 99, car_insurance: 1000, 
            third_party_insurance: 1499)
        
        visit new_car_category_path
        
        fill_in "Nome", with: 'A'
        fill_in "Diária Padrão", with: 99
        fill_in "Seguro do Carro", with: 1000
        fill_in "Seguro para Terceiros", with: 1499
        click_on "Enviar"
        expect(page).to have_content('Há campos em está em uso')
    end
end
