module ApplicationHelper

    def error_messages_for(object)
        render "layouts/shared/error_explanation", model_name: object
    end
end
