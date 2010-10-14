module ActionView
  module Helpers
    module FormTagHelper
      # Add option to label_tag to suffix/prefix a string to the content
      def label_tag_with_modifiers(name = nil, content_or_options = nil, options = nil, &block)
        # text to suffix
        if content_or_options && content_or_options.is_a?(Hash)
          suffix = content_or_options.delete("suffix") if content_or_options.keys.include?("suffix")
          suffix = content_or_options.delete(:suffix) if content_or_options.keys.include?(:suffix)
        elsif options && options.is_a?(Hash)
          suffix = options.delete("suffix") if options.keys.include?("suffix")
          suffix = options.delete(:suffix) if options.keys.include?(:suffix)
        end
        suffix ||= LabelBuilder.prefix

        # text to prefix
        if content_or_options && content_or_options.is_a?(Hash)
          prefix = content_or_options.delete("prefix") if content_or_options.keys.include?("prefix")
          prefix = content_or_options.delete(:prefix) if content_or_options.keys.include?(:prefix)
        elsif options && options.is_a?(Hash)
          prefix = options.delete("prefix") if options.keys.include?("prefix")
          prefix = options.delete(:prefix) if options.keys.include?(:prefix)
        end
        prefix ||= LabelBuilder.suffix

        html = label_tag_without_modifiers(
          name, 
          content_or_options, 
          options, 
          &block
        )
        html.gsub(
          /(<label for=".*">)(.*)(<\/label>)/, 
          '\1'+prefix+'\2'+suffix+'\3'
        )
      end
      alias_method_chain :label_tag, :modifiers
    end
  end
end
