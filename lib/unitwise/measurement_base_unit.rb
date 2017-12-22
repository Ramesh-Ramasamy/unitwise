module Unitwise
	class MeasurementBaseUnit	 < ActiveRecord::Base
		set_primary_key :measurement_base_unit_id
		def self.insert_base_unit
			YAML.load(File.open(Unitwise.data_file "base_unit")).each do |m|
	      Unitwise::MeasurementBaseUnit.create!(m)
	    end
		end
	end
end