require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'


class SalesEngineTest < Minitest::Test

  def test_it_exists
    items = "./data/items.csv"
    merchants = "./data/merchants.csv"
    sales_engine = SalesEngine.new(items, merchants)

    assert_instance_of SalesEngine, sales_engine
  end

  def test_factory_method_creates_instance
    sales_engine = SalesEngine.from_csv({
          :items     => "./data/items.csv",
          :merchants => "./data/merchants.csv",
          })

    assert_instance_of SalesEngine, sales_engine
  end

  def test_it_has_attributes_from_factory
    skip
    sales_engine = SalesEngine.from_csv({
          :items     => "./data/items.csv",
          :merchants => "./data/merchants.csv",
          })

    assert_equal "./data/items.csv", sales_engine.items
    assert_equal "./data/merchants.csv", sales_engine.merchants
  end

  def test_it_creates_merchant_repository_object
    sales_engine = SalesEngine.from_csv({
          :items     => "./data/items.csv",
          :merchants => "./data/merchants.csv",
          })

    assert_instance_of MerchantRepository, sales_engine.merchants
  end

  def test_it_creates_item_repository_object
    sales_engine = SalesEngine.from_csv({
          :items     => "./data/items.csv",
          :merchants => "./data/merchants.csv",
          })

    assert_instance_of ItemRepository, sales_engine.items
  end

end
