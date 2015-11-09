Redmine::Plugin.register :esteren do
  name 'Esteren plugin'
  author 'Alex "Pierstoval" Rock Ancelet'
  description 'Esteren tools for Redmine'
  version '0.1.0'
  url 'http://esteren.org'
  author_url 'http://www.Orbitale.io'

  menu(
    :top_menu,
    :esteren,
    {:controller => :issues, :action => :index},
    :caption => :label_issue_plural,
    :if => Proc.new {
      User.current.allowed_to?(:view_issue, nil, :global => true) or
      User.current.admin?
    }
  )

  menu(
    :top_menu,
    :esteren,
    {:controller => :time_entries, :action => :index},
    :caption => :label_time_tracking,
    :if => Proc.new {
      User.current.allowed_to?(:view_time_entries, nil, :global => true) or
      User.current.admin?
    }
  )

end
