Pod::Spec.new do |s|
  s.name             = 'ComposedDataSource'
  s.version          = '1.0'
  s.summary          = '[Objective-C] A simple library that allows you to create complex table view layouts'
  s.description      = 'A simple library that allows you to create complex table view layouts. Can using single data source, multiple data source'
  s.homepage         = 'https://github.com/stevernguyen/ComposedDataSource'

  s.license          = 'MIT'
  s.author           = { 'Quynh Nguyen Van' => 'quynhnv8668@gmail.com' }
  s.source           = { :git => 'https://github.com/stevernguyen/ComposedDataSource.git', :branch => 'master', :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'DataSource/*.{h,m}'
  
end
