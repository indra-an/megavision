class MenuParent < MenuSetting
  has_many :menu_childs, foreign_key: :parent_id

end
