class CreateNumberValidators < ActiveRecord::Migration[7.0]
  def change
    create_table :number_validators do |t|

      t.timestamps
    end
  end
end
