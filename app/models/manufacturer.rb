class Manufacturer < ApplicationRecord

    has_many :car_models
    

    validates :name, presence: { message: 'Os campos não podem ficar em branco.' }
    validates :name, uniqueness: { message: 'Nome já está em uso'}
end
