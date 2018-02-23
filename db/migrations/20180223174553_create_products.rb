Hanami::Model.migration do
  change do
    create_table :products do
      primary_key :id

      column :product_name, String,  null: false
      column :quantity,     Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
