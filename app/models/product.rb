class Product < ApplicationRecord

    belongs_to business
    has_many images
end
