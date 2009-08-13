ENV['RAILS_ENV'] = 'test'

require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'test_help'
require 'high_voltage'
require 'active_record'

$KCODE = 'u'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'models')

ActiveRecord::Base.establish_connection({
    'adapter' => 'sqlite3',
    'database' => ':memory:'
  })
load(File.join(File.dirname(__FILE__), 'schema.rb'))


require 'shoulda'
require 'shoulda/rails'
