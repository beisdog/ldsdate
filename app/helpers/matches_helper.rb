module MatchesHelper
  def say_link(name, user, status_id, sent_statuses)
    link_to(
      name,
      matches_path(:user_id => user.id, :status_id => status_id),
      :remote => true,
      :method => 'post', :class => "#{link_classes(name)} #{selected_link(name, sent_statuses, user)}"
    )
  end

  private

  def link_classes(name)
    colors = {
      'Yes' => 'green',
      'No' => 'red'
    }
    colors[name]
  end

  def selected_link(name, sent_statuses, user)
    selected = {
      'Yes' => 'selected_yes',
      'No' => 'selected_no',
      'Maybe' => 'selected_maybe'
    }
    selected[sent_statuses[user.id]] if sent_statuses[user.id] == name
  end
end
