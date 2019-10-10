require 'pry'

class Building
    attr_reader :address
    attr_accessor :name, :number_of_tenants

    @@building_list = []

    def initialize(name, address, number_of_floors, number_of_tenants)
        @name = name 
        @address = address 
        @number_of_floors = number_of_floors
        @number_of_tenants = number_of_tenants
        @@building_list << self
    end

    def self.average_tenants_building
        tenants = @@building_list.map { |building| building.number_of_tenants }
        total_tenants = tenants.reduce { |sum, tenant| sum + tenant}
        total_tenants / @@building_list.size
    end

    def building_name_address
        "#{@name} - #{@address}"
    end

    def average_tenants_per_floor
        @number_of_tenants / @number_of_floors
    end
end

building_1 = Building.new("Building 1", "1234 Downing St", 3, 30)
building_2 = Building.new("Building 2", "1234 Grant St", 4, 400)
building_3 = Building.new("Building 3", "1234 Sherman St", 5, 50)
building_1.building_name_address

binding.pry
0