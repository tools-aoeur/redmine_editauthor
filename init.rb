require_relative 'lib/redmine_editauthor'

Redmine::Plugin.register :redmine_editauthor do
  name "Edit Author"
  author "Ralph Gutkowski (orig)"
  description "Enables setting the author on issue edit or create, for allowed users."
  version '1.0.0'
  url 'https://github.com/tools-aoeur/redmine_editauthor'
  author_url 'https://github.com/tools-aoeur'

  settings default: {
    'members_scope' => false
  }, partial: 'settings/redmine_editauthor'

  project_module :issue_tracking do
    permission :edit_issue_author, {}
    permission :set_original_issue_author, {}
  end
end

RedmineEditauthor.install
