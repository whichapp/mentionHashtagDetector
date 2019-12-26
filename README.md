# whichappMHdetector

[![CI Status](https://img.shields.io/travis/whichapp/whichappMHdetector.svg?style=flat)](https://travis-ci.org/whichapp/whichappMHdetector)
[![Version](https://img.shields.io/cocoapods/v/whichappMHdetector.svg?style=flat)](https://cocoapods.org/pods/whichappMHdetector)
[![License](https://img.shields.io/cocoapods/l/whichappMHdetector.svg?style=flat)](https://cocoapods.org/pods/whichappMHdetector)
[![Platform](https://img.shields.io/cocoapods/p/whichappMHdetector.svg?style=flat)](https://cocoapods.org/pods/whichappMHdetector)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Description
**whichappMHdetector** can detect `@` and `#` while you are typing or even if you move back cursor to a mention or hashtag word area and then you can edit it.

<p align="center">
<img src="https://github.com/whichapp/mentionHashtagDetector/blob/master/Example/whichappMHdetector/Images.xcassets/Mention.imageset/Menton.png" width="350" title="whichappMHdetector Mention">

<img src="https://github.com/whichapp/mentionHashtagDetector/blob/master/Example/whichappMHdetector/Images.xcassets/hashtag.imageset/hashtag.png" width="350" alt="whichappMHdetector Hashtag">
</p>


## Usage

1- Import **whichappMHdetector**
```swift
import UIKit
import whichappMHdetector
```

2- make an instance of **mentionHashtagDetector** and set the delegates
```swift
//Making instance
let mentionHashtag = mentionHashtagDetector()
override func viewDidLoad() {
    super.viewDidLoad()

    ///Setting Delegates:
    //UITextView Delegate
    textView.delegate = self
    //mentionHashtagDetector Delegate
    mentionHashtag.delegate = self
}
```

3- call **detectSign** function each time text change, simply calling this function under  `textViewDidChange`
```swift
extension ViewController:UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        ///send every change in UITextView to the mentionHashtagDetector
        mentionHashtag.detectSign(textView: textView)
    }
}
```

4- listen to **mentionHashtagDetectorDelegate**
```swift
///Response of mentionHashtagDetector
extension ViewController:mentionHashtagDetectorDelegate {
    func didSignDetected(_ text: String, _ signType: signTypeModels) {
        //Print("\(text)  Type=> \(signType)")
    }
}
```

5- Done :)


## Installation

whichappMHdetector is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'whichappMHdetector'
```

## Author

sajjadsarkoobi, sarkoobi@whichapp.com

## License

whichappMHdetector is available under the MIT license. See the LICENSE file for more info. 
Created for [HICH](https://www.hichapp.com)

