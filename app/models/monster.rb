class Monster < ApplicationRecord
  validates :name, :birthdate, presence: true
  validate :numero_de_telefono_tiene_que_ser_valido

  def numero_de_telefono_tiene_que_ser_valido
    if NumberValidator.new(phone).valid?
      return
    else 
      error.add(:phone, :invalid)
    end

  end
end
