class AddSkillResultToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :skill_result, :string
  end
end
