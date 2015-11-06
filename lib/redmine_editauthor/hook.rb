module RedmineEditauthor
  module Hook
    class ViewListener < Redmine::Hook::ViewListener
      include IssuesHelper

      # necessary for using content_tag in Listener
      attr_accessor :output_buffer

      def view_issues_form_details_bottom(context = {})
        issue, project = context[:issue], context[:project]

        return if issue.new_record? || !User.current.allowed_to?(:edit_issue_author, project)

        content_tag(:p, id: 'editauthor') do
          o = options_from_collection_for_select(issue.assignable_users.collect,
                                                 'id', 'name', issue.author_id)

          concat label_tag('issue[author_id]', l(:field_author))
          concat select_tag('issue[author_id]', o)
          concat "<script>$('#editauthor').insertBefore($('#issue_project_id').parent());</script>".html_safe
        end
      end

      def helper_issues_show_detail_after_setting(context = {})
        d = context[:detail]

        if d.prop_key == 'author_id'
          d[:value] = find_name_by_reflection('author', d.value)
          d[:old_value] = find_name_by_reflection('author', d.old_value)
        end
      end
    end
  end
end