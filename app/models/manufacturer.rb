class Manufacturer < ApplicationRecord
    validates :name, presence: { message: 'Os campos não podem ficar em branco.' }
    validates :name, uniqueness: { message: 'Nome já está em uso'}
end
