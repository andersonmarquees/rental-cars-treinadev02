class CarCategory < ApplicationRecord

    has_many :car_models

    validates :name, :daily_rate, :car_insurance, :third_party_insurance,
    presence: { message: 'Você deve informar todos os campos'}
    
    validates :name, :daily_rate, :car_insurance, :third_party_insurance,
    uniqueness: { message: 'Há campos em está em uso'}
end
