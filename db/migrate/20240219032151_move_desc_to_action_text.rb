class MoveDescToActionText < ActiveRecord::Migration[7.1]
  def change
    Product.all.find_each do |product|
      product.update content: product.desc
    end

    remove_column :products, :desc
  end
end
