Sequel.migration do
  up do
    create_table :states do
      primary_key :id
      Name :string
    end
  end

  down do
    drop_table :states
  end
end
