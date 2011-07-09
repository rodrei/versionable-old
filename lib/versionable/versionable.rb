module Versionable
  module Base

    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
      def versionable_field(field)
        define_method field do
          return nil if self[field].nil?
          version = self[field].to_s
          version.sub! /.+\./, ''
          version = version.ljust(9,'0')
          version = [version[0..2], version[3..5], version[6..8]]
          version.map! { |v| v.sub /\A0{0,2}/, '' }
          version.delete_at(2) if version[2] == '0'
          version.join('.')
        end

        define_method "#{field}=" do |version|
          self[field] = case version
            when Float
              self[field] = field
            when /\A\d{1,3}(\.\d{1,3}(\.\d{1,3})?)?\z/
              version = version.to_s.split "."

              v = 0.0
              version.each_with_index do |n, index|
                v += n.to_i * (10 ** (-(index+1) * 3))
              end
              v
            else
              nil
          end

        end

        define_method "raw_#{field}" do
          self[field]
        end

        define_method "raw_#{field}=" do |val|
          self[field] = val
        end
      end
    end
  end
end
