class AddSlugToVacancies < ActiveRecord::Migration[5.0]
  def change
    add_column :vacancies, :slug, :string
    add_index :vacancies, :slug
  end
end
