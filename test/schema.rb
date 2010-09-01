ActiveRecord::Schema.define(:version => 0) do
  create_table :flames, :force => true do |t|
    t.string :name1
    t.string :name2
    t.string :result
  end
end