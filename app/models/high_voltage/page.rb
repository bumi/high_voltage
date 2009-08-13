class HighVoltage::Page < ActiveRecord::Base
  set_table_name "high_voltage_pages"
  
  validates_presence_of :permalink
  validates_uniqueness_of :permalink
  
  before_validation :insert_permalink
  
  def to_param
    permalink
  end
  
  protected
    def insert_permalink
      self.permalink = (self.permalink || self.title).to_s.parameterize
    end
end