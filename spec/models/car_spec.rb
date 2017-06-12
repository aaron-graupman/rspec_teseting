require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:mileage) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:exterior_color) }
    it { should validate_presence_of(:interior_color) }
  end

# # = instance method
# . = class method
  describe '#info' do
    it 'displays info about the car' do
    car = Car.create(make: 'Kia', model: 'Rio',
                     year: 2013, mileage: 65000,
                     price: 13000, exterior_color: 'red',
                     interior_color: 'grey')
    expect(car.info).to eq('Kia Rio has an exterior color of red.')
    end
  end

  describe '#old?' do
    it 'returns true if mileage is > 150000' do
      car = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 200000,
                       price: 13000, exterior_color: 'red',
                       interior_color: 'grey')
      expect(car.old?).to eq(true)
    end

    it 'returns true if mileage = 150000' do
      car = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 150000,
                       price: 13000, exterior_color: 'red',
                       interior_color: 'grey')
      expect(car.old?).to eq(true)
    end

    it 'returns false if mileage < 150000' do
      car = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 13000, exterior_color: 'red',
                       interior_color: 'grey')
      expect(car.old?).to eq(false)
    end
  end


  describe '#expensive?' do
    it 'returns true if price > 30000' do
      car = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 500000, exterior_color: 'red',
                       interior_color: 'grey')
      expect(car.expensive?).to eq(true)
    end

    it 'returns false if price = 30000' do
      car = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 30000, exterior_color: 'red',
                       interior_color: 'grey')
      expect(car.expensive?).to eq(false)
    end

    it 'returns false if price < 30000' do
      car = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 13000, exterior_color: 'red',
                       interior_color: 'grey')
      expect(car.expensive?).to eq(false)
    end
  end

  describe '.by_highest_price' do
    it 'returns array of cars ordered by highest price' do
      car1 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 1500, exterior_color: 'red',
                       interior_color: 'grey')
      car2 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 4500, exterior_color: 'red',
                       interior_color: 'grey')
      ordered_cars = Car.all.by_highest_price
      expect(ordered_cars.first).to eq(car2)
      expect(ordered_cars.last).to eq(car1)
    end
  end

  describe '.by_mileage' do
    it 'orders cars by asc mileage' do
      car1 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 70000,
                       price: 1500, exterior_color: 'red',
                       interior_color: 'grey')
      car2 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 4500, exterior_color: 'red',
                       interior_color: 'grey')
      ordered_cars = Car.all.by_mileage
      expect(ordered_cars.first).to eq(car2)
      expect(ordered_cars.last).to eq(car1)
    end

    it 'orders cars by desc mileage' do
      car1 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 1500, exterior_color: 'red',
                       interior_color: 'grey')
      car2 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 70000,
                       price: 4500, exterior_color: 'red',
                       interior_color: 'grey')
      ordered_cars = Car.all.by_mileage
      expect(ordered_cars.first).to eq(car1)
      expect(ordered_cars.last).to eq(car2)
    end
  end

  describe '.by_year' do
    it 'orders cars by asc year' do
      car1 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2013, mileage: 65000,
                       price: 1500, exterior_color: 'red',
                       interior_color: 'grey')
      car2 = Car.create(make: 'Kia', model: 'Rio',
                       year: 2004, mileage: 70000,
                       price: 4500, exterior_color: 'red',
                       interior_color: 'grey')
      ordered_cars = Car.all.by_year
      expect(ordered_cars.first).to eq(car2)
      expect(ordered_cars.last).to eq(car1)
    end
  end
end
