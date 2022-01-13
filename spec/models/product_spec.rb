require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    @category = Category.new(name: "cat1")
    it 'should create product with all valid failds' do
      @product = Product.new(
        name: "p1",
        price: 12345,
        quantity: 10,
        category_id: 1
      )
      expect(@product.save).to be true
    end

    it 'should not save without name' do
      @product = Product.new(
        price: 12345,
        quantity: 10,
        category_id: 1
      )
      expect(@product.save).to be false
    end

    it 'should not save without prices' do
      @category = Category.new(name: "cat1")
      @product = Product.new(
        name: "p1",
        quantity: 10,
        category_id: 1
      )
      expect(@product.save).to be false
    end

    #validates: name, presence: true
    it 'should not save without quantity' do
      @product = Product.new(
        name: "123",
        price: 12345,
        category_id: 1
      )
      expect(@product.save).to be false
    end

    #validates: name, presence: true
    it 'should not save without category' do
      @product = Product.new(
        name: "abc",
        price: 10234,
        quantity: 10
      )
      expect(@product.save).to be false
    end
  end
end
