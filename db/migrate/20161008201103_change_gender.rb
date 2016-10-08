class ChangeGender < ActiveRecord::Migration
  def change
    change_column :people, :gender, :integer
  end
end
