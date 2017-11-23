module Unitwise
	class MeasurementDerivedUnit	 < ActiveRecord::Base
		serialize :scale
		serialize :names
		def self.insert_derived_unit
			YAML.load(File.open(Unitwise.data_file "derived_unit")).each do |m|
	      Unitwise::MeasurementDerivedUnit.create!(m)
	    end
		end
	end
end