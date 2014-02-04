class CreateStopOnRoutes < ActiveRecord::Migration
  def change
    create_table :stop_on_routes do |t|
      t.integer :stop_id
      t.string :route

      t.timestamps
    end
    add_index :stop_on_routes,  :stop_id
  end
end
