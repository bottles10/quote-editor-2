module ApplicationHelper

    def error_messages_for(object)
        render "layouts/shared/error_explanation", model_name: object
    end

    def render_turbo_stream_flash_messages
        turbo_stream.prepend "flash", partial: "layouts/shared/flash"
    end
end
