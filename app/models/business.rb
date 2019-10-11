class Business < ApplicationRecord

    belongs_to :user
    has_many :products, dependent: :destroy

    validates :name, :tax_id, presence: true
    validates :name, :tax_id, uniqueness: true


    validates :tax_id, numericality: { only_integer: true }
    validates :tax_id, length: { maximum: 10 }


end
