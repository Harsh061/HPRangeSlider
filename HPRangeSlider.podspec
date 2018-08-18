Pod::Spec.new do |s|
          #1.
          s.name               = "HPRangeSlider"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary         = "This pod helps you add one way range slider to any view"
          #4.
          s.homepage        = "https://github.com/Harsh061/HPRangeSlider.git"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "Harshit"
          #7.
          s.platform            = :ios, "10.0"
          #8.
          s.source              = { :git => "https://github.com/Harsh061/HPRangeSlider.git", :tag => "1.0.0" }
          #9.
          s.source_files     = "HPRangeSlider", "HPRangeSlider/**/*.{h,m,swift}"
    end