class HighVoltageGenerator < Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "create_high_voltage_pages"
    end
  end
end
