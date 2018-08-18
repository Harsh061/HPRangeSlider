# HPRangeSlider

HPRangeSlider is a pod which helps to add slider to any UIVIew. It is written in Swift 4.

# Installation
### Using Cocoapods
1. Open podfile in your project.
2. Add the following into your podfile:
```   
pod ‘HPRangeSlider’, :git => ‘https://github.com/Harsh061/HPRangeSlider.git’, :tag => ‘1.0.0’ 
```
3. Run the command:
```
pod install
```

## Usage
1. Open the project. Drag a UIView into storyboard.
2. Go the the identity inspector and in the class field, type HPRangeSlider instead of UIView.
3. Open the viewcontroller. Import HPRangeSlider.
```
import HPRangeSlider
```
4. Create an outlet of the view.
```
@IBOutlet weak var rangeSlider: HPRangeSlider!
```
5. Set your custom properties like sliderTitle, value, minValue, maxValue and handleTintColor.

#### Example:
```
private func setupSlider() {
   rangeSlider.delegate = self
   rangeSlider.sliderTitle = ""
   rangeSlider.value = 0
   rangeSlider.minValue = 0
   rangeSlider.maxValue = 10
   rangeSlider.handleTintColor = UIColor.red
}
```
6. Confirm to the delegate method
```
extension ViewController: HPRangeSliderDelegate {
    func rangeSlider(selectedValue: Float) {
        print("Current value", selectedValue)
    }
}
```
