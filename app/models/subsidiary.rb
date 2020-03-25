class Subsidiary < ApplicationRecord
    validates :name, :cnpj, :address, presence: { message: 'Você deve informar todos os campos'}
end
