module RedmineEditauthor
  PLUGIN_ID = :redmine_editauthor

  module Settings
    class << self
      def defaults
        Redmine::Plugin.find(PLUGIN_ID).settings[:default] || {}
      end

      def method_missing(method_name)
        s = Setting.method("plugin_#{PLUGIN_ID}")

        name = method_name.to_s.sub('?', '')

        if defaults.include?(name)
          m = {}
          value = defaults[name]

          case value
          when Array
            m[name] = proc { s.call[name] || value }
            m["#{name}?"] = proc { (s.call[name] || value).any? }
          when Integer
            m[name] = proc { v = s.call[name]; v.present? ? v.to_i : value }
          when TrueClass, FalseClass
            p = proc { v = s.call[name]; v ? (!!v == v ? v : v.to_i > 0) : value }
            m[name] = p
            m["#{name}?"] = p
          else
            m[name] = proc { s.call[name] || value }
            m["#{name}?"] = proc { (s.call[name] || value).present? }
          end

          m.each { |k, v| define_singleton_method(k, v) }

          send(method_name)
        else
          super
        end
      end
    end
  end

  def self.patch
    require_relative "redmine_editauthor/patches/issue_patch"

    unless Issue.included_modules.include?(RedmineEditauthor::Patches::IssuePatch)
      Issue.send(:include, RedmineEditauthor::Patches::IssuePatch)
    end
  end

  def self.hook
    require_relative "redmine_editauthor/hook"
  end

  def self.install
    patch
    hook
  end
end
