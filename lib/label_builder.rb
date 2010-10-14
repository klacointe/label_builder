require 'label_builder/core'

module LabelBuilder

  mattr_accessor :prefix
  @@prefix = ""

  mattr_accessor :suffix
  @@suffix = ""

  class Engine < Rails::Engine

    config.label_builder = LabelBuilder

    initializer "label_builder.initialize" do |app|
      app.config.label_builder.prefix ||= LabelBuilder.prefix
      app.config.label_builder.suffix ||= LabelBuilder.suffix
    end
  end
end
