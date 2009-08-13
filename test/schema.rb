ActiveRecord::Schema.define(:version => 0) do

  create_table :high_voltage_pages, :force => true do |t|
    t.string :title, :permalink
    t.text :body
  end

end
