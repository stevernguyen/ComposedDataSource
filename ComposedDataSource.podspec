Pod::Spec.new do |s|
  s.name             = "ComposedDataSource"
  s.version          = "0.1.0"
  s.summary          = "A short description of ComposedDataSource."
  s.description      = <<-DESC
                       An optional longer description of ComposedDataSource

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/stevernguyen/ComposedDataSource"

  s.license          = 'MIT'
  s.author           = { "Quynh Nguyen Van" => "quynhnv8668@gmail.com" }
  s.source           = { :git => "https://github.com/stevernguyen/ComposedDataSource.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'DataSource//*.{h,m}'
  
end
