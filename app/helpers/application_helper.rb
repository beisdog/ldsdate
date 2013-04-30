module ApplicationHelper

  def readonly_input(name, *args)
      @name = name
      @field_options = field_options(args)
      @args = args

      control_group_div do
        label_field + input_div do
          extras do
            value = @field_options.delete(:value)
            @field_options[:class] = @field_options[:class]

            content_tag(:span, @field_options) do
              value || object.send(@name.to_sym) rescue nil
            end
          end
        end
      end
  end

  def r_widget(html_options = {}, &block)
    @r_widgets ||= ''
    @r_widgets << render(:partial => 'shared/widget', :locals => {:body => capture(&block), :html_options => html_options})
    return ''
  end

  def render_r_widgets
    if @r_widgets
      @r_widgets.html_safe
    end
  end
end
