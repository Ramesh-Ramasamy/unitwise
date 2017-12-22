module Unitwise
	class MeasurementPrefixUnit < ActiveRecord::Base
		set_primary_key :measurement_prefix_unit_id
		def self.insert_prefix_unit
			YAML.load(File.open(Unitwise.data_file "prefix")).each do |m|
	      Unitwise::MeasurementPrefixUnit.create!(m)
	    end
		end
	end
end