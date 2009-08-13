require 'test_helper'

class HighVoltage::PageTest < ActiveSupport::TestCase
  
  context "a Page" do
    
    should_validate_presence_of :permalink
    
    context "on create" do
      
      should "save parameterized title as permalink" do
        page = HighVoltage::Page.create(:title => "hello world!")
        assert_equal "hello-world", page.permalink
        assert_equal "hello-world", page.to_param
      end
      
      should "not overwrite user defined permalink" do
        page = HighVoltage::Page.create(:title => "hello world!", :permalink => "my-permalink")
        assert_equal "my-permalink", page.permalink
        assert_equal "my-permalink", page.to_param
      end
      
      should "parameterize user entered permalink" do
        page = HighVoltage::Page.create(:title => "hello world!", :permalink => "my über cool pärmalink")
        assert_equal "my-uber-cool-parmalink", page.permalink
        assert_equal "my-uber-cool-parmalink", page.to_param
      end
    end
    
  end
end
