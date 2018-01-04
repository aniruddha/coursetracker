class AddMobileToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :mobile, :string
  end
end
