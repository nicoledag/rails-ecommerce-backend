class BusinessSerializer 
  include FastJsonapi::ObjectSerializer
  
  attributes :id, :name, :tax_id, :created_at

  attribute :products do |business|
    business.products.map do |product|
      {
        name: product.name,
        description: product.description,
        subcategory_name: product.subcategory.name,
        subcategory_id: product.subcategory.id,
        category_name: product.category.name,
        category_id: product.category.id,
        price: product.price,
        item_number: product.item_number,
        business_id: product.business_id,
        image: product.image,
        id: product.id
      }
    end
  end

  # has_many :products, dependent: :destroy
end
