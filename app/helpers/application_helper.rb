module ApplicationHelper

    def error_messages_for(object)
        render "layouts/shared/error_explanation", model_name: object
    end

    def render_turbo_stream_flash_messages
        turbo_stream.prepend "flash", partial: "layouts/shared/flash"
    end

    def nested_dom_id(*args)
        args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
    end
end
