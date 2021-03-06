Redmine::Plugin.register :esteren do
  name 'Esteren plugin'
  author 'Alex "Pierstoval" Rock Ancelet'
  description 'Esteren tools for Redmine'
  version '0.2.2'
  url 'http://esteren.org'
  author_url 'http://www.Orbitale.io'

  menu(
    :top_menu,
    :esteren_issues,
    {:controller => :issues, :action => :index},
    :caption => :label_issue_plural,
    :if => Proc.new {
      User.current.allowed_to?(:view_issue, nil, :global => true) or
      User.current.admin?
    }
  )

  menu(
    :top_menu,
    :esteren_time_entries,
    {:controller => :timelog, :action => :index},
    :caption => :label_time_tracking,
    :if => Proc.new {
      User.current.allowed_to?(:view_time_entries, nil, :global => true) or
      User.current.admin?
    }
  )

end
