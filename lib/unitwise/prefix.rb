module Unitwise
  # A prefix can be used with metric atoms to modify their scale.
  class Prefix < Base
    liner :scalar, :measurement_prefix_unit_id

    # The data loaded from the UCUM spec files
    # @api semipublic
    def self.data
      # @data ||= YAML.load File.open(data_file)
      @data ||= Unitwise::MeasurementPrefixUnit.all.map(&:attributes).map(&:with_indifferent_access)
    end

    # The location of the UCUM spec prefix data file
    # @api semipublic
    def self.data_file
      Unitwise.data_file 'prefix'
    end

    # Set the scalar value for the prefix, always as a BigDecimal
    # @api semipublic
    def scalar=(value)
      @scalar = BigDecimal(value.to_s)
    end
  end
end
