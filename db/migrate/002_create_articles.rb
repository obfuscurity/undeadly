Sequel.migration do
  up do
    create_table :articles do
      primary_key :id
      
    end
  end

  down do
    drop_table :articles
  end
end
