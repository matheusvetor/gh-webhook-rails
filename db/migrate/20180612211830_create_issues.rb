# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string     :action, null: false
      t.references :repository, foreign_key: true
      t.jsonb      :metadata, default: '{}'

      t.timestamps
    end
  end
end
