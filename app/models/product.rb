class Product < ActiveRecord::Base
  validates :name, :description, :price, presence: true

  def bargain?
    price < 1000
  end

end
