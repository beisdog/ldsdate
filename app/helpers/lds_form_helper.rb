module LdsFormHelper

  # this is one way to define new instance methods
  BootstrapForms::FormBuilder.class_eval do
    
    def readonly_input(name, *args)
      @name = name
      @field_options = field_options(args)
      @args = args

      control_group_div do
        label_field + input_div do
          extras do
            value = @field_options.delete(:value)
            @field_options[:class] = [@field_options[:class], 'uneditable-input'].compact

            content_tag(:span, @field_options) do
              value || object.send(@name.to_sym) rescue nil
            end
          end
        end
      end
    end
  end



  
end
  