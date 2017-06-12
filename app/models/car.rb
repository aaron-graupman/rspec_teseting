class Car < ApplicationRecord
  validates_presence_of :make, :model, :year,
                        :mileage, :price,
                        :exterior_color, :interior_color

  def info
    "#{make} #{model} has an exterior color of #{exterior_color}."
  end

  def old?
    mileage >= 150000 ? true : false
  end

  def expensive?
    price > 30000
  end

  def self.by_highest_price
    order(price: :desc)
  end

  def self.by_mileage(lowest = true)
    lowest ? order(:mileage) : order(mileage: :desc)
  end

  def self.by_year
    order(:year)
  end

  serialize :upgrades, Array
end
