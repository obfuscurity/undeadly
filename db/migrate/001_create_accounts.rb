Sequel.migration do
  up do
    create_table :accounts do
      primary_key :id
      String :username
      String :name
      String :email
      String :url
      String :crypted_password
      String :role
    end
  end

  down do
    drop_table :accounts
  end
end
