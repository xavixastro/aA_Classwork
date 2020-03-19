require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    @items ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        '#{table_name}'
    SQL
    @items.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |item|
      define_method(item) do
        self.attributes[item] 
      end
      define_method("#{item}=") do |val|
        self.attributes[item] = val
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end
 
  def self.table_name
    # ...
    @table_name || self.to_s.tableize 
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |k, v|
      if !columns.include?(k.to_symbol)
        raise "unknown attribute '#{k}'"
      else
        self.send :finalize!, k, v
      end
    end
  end

  def attributes
    # ...
      @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
