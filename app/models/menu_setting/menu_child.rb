class MenuChild < MenuSetting
  belongs_to :menu_parent, foreign_key: :parent_id
end
