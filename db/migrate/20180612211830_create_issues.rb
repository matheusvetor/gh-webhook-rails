# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :action, default: 0, null: false
      t.integer :repository_id, null: false, index: true
      t.string  :repository_name, default: '', null: false
      t.string  :owner_name, default: '', null: false

      t.timestamps
    end
  end
end
