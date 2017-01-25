class AddSkillFields < ActiveRecord::Migration
  def change
    add_column :skills, :skill_result_year, :string
    add_column :skills, :skill_result_video_link, :string
  end
end
