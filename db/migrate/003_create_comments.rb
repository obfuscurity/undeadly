Sequel.migration do
  up do
    create_table :comments do
      primary_key :id
      
    end
  end

  down do
    drop_table :comments
  end
end
