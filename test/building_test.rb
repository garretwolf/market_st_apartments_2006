require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test
  def test_it_exists
    building = Building.new

    assert_instance_of Building, building
  end

  def test_units_array_is_empty
    building = Building.new

    assert_equal [], building.units
  end

  def test_it_can_add_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [unit1, unit2], building.units
  end

  def test_it_can_add_renters
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Aurora")
    building.add_unit(unit1)
    unit1.add_renter(renter1)

    assert_equal ["Aurora"], building.renters
  end

  def test_it_can_calculate_average_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)
    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)

    assert_equal 1099.5, building.average_rent
  end

  def test_rented_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    renter1 = Renter.new("Spencer")
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    unit2.add_renter(renter1)

    assert_equal [unit2], building.rented_units
  end

  # def test_renter_with_highest_rent
  #   building = Building.new
  #   unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  #   unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
  #   unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
  #   unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
  #   renter1 = Renter.new("Spencer")
  #   building.add_unit(unit1)
  #   building.add_unit(unit2)
  #   building.add_unit(unit3)
  #   unit2.add_renter(renter1)
  #
  #   assert_equal [unit4], building.renter_with_highest_rent
  # end
end
