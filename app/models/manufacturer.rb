class Manufacturer < ApplicationRecord
    validates :name, presence: { message: 'Os campos não podem ficar em branco.' }
end
