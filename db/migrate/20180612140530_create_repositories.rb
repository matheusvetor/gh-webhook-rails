class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'
    create_table :repositories do |t|
      t.jsonb :metadata, default: '{}'

      t.timestamps
    end
  end
end
