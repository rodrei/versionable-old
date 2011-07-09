class VersionableModel
  include Versionable::Base

  include ::ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :version
  versionable_field :version

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def []=(ind, value)
    if ind == :version
      @version = value
    end
  end

  def [](ind)
    if ind == :version
      @version
    else
      nil
    end
  end
end

