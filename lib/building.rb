class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    get_name = @units.map do |unit|
      unit.renter.name
    end
    get_name
  end
# couldn't get sum to work
  def average_rent
   @units.sum do |unit|
    (unit.monthly_rent.to_f / 2).round(1)
  end
  end
end
